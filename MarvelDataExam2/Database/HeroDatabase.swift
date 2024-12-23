import Foundation
import SwiftData

enum DatabaseError: Error {
    case errorInsert
    case errorFetch
    case errorUpdate
    case errorRemove
}

protocol HeroDatabaseProtocol {
    func insert(hero: HeroDetailLocal) throws
    func fetchAll() throws -> [HeroDetailLocal]
    func update(identifier: UUID, nombre: String, primeraAparicion: String?, imagen: String?) throws
    func remove(identifier: UUID) throws
}


class HeroDatabase: HeroDatabaseProtocol{
    static let shared: HeroDatabase = HeroDatabase()
    
    @MainActor
    var container: ModelContainer = setupContainer(inMemory: false)
    
    private init() {}
    
    @MainActor
    static func setupContainer(inMemory: Bool) -> ModelContainer {
        do {
            let container = try ModelContainer(for: HeroDetailLocal.self, configurations: ModelConfiguration(isStoredInMemoryOnly: inMemory))
            
            container.mainContext.autosaveEnabled = true
            
            return container
        } catch {
            print("Error: \(error.localizedDescription)")
            fatalError("La base de datos no fue creada")
        }
    }
    
    
    @MainActor
    func insert(hero: HeroDetailLocal) throws {
        container.mainContext.insert(hero)
        
        do {
            try container.mainContext.save()
        } catch {
            print("Error: \(error.localizedDescription)")
            throw DatabaseError.errorInsert
        }
    }
    
    @MainActor
    func fetchAll() throws -> [HeroDetailLocal] {
        let fetchDescriptor = FetchDescriptor<HeroDetailLocal>(sortBy: [SortDescriptor<HeroDetailLocal>(\.createdAt)])
        
        do {
            return try container.mainContext.fetch(fetchDescriptor)
        } catch {
            print("Error: \(error.localizedDescription)")
            throw DatabaseError.errorFetch
        }
    }
    
    @MainActor
    func update(identifier: UUID, nombre: String, primeraAparicion: String?, imagen: String?) throws {
        let heroPredicate = #Predicate<HeroDetailLocal> {
            $0.identifier == identifier
        }
        
        var fetchDescriptor = FetchDescriptor<HeroDetailLocal>(predicate: heroPredicate)
        fetchDescriptor.fetchLimit = 1
        
        do {
            guard let updateHero = try container.mainContext.fetch(fetchDescriptor).first else {
                throw DatabaseError.errorUpdate
            }
            
            updateHero.nombre = nombre
            updateHero.primeraAparicion = primeraAparicion
            updateHero.imagen = imagen

            
            try container.mainContext.save()
        } catch {
            print("Error al actualizar la información")
            throw DatabaseError.errorUpdate
        }
    }
    
    @MainActor
    func remove(identifier: UUID) throws {
        let heroPredicate = #Predicate<HeroDetailLocal> {
            $0.identifier == identifier
        }
        
        var fetchDescriptor = FetchDescriptor<HeroDetailLocal>(predicate: heroPredicate)
        fetchDescriptor.fetchLimit = 1
        
        do {
            guard let deleteHero = try container.mainContext.fetch(fetchDescriptor).first else {
                throw DatabaseError.errorRemove
            }
            
            container.mainContext.delete(deleteHero)
            
            try container.mainContext.save()
        } catch {
            print("Error al borrar la información")
            throw DatabaseError.errorRemove
        }
    }
}
