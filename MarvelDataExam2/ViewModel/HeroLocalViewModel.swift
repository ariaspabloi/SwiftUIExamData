import Foundation
import Observation

@Observable
class HeroViewModel {
    
    var heroes: [HeroDetailLocal]
    
    var createHeroUseCase: CreateHeroProtocol
    var fetchAllHeroesUseCase: FetchAllHeroesProtocol
    var updateHeroUseCase: UpdateHeroProtocol
    var removeHeroUseCase: RemoveHeroProtocol
    
    init(heroes: [HeroDetailLocal] = [],
         createHeroUseCase: CreateHeroProtocol = CreateHeroUseCase(),
         fetchAllHeroesUseCase: FetchAllHeroesProtocol = FetchAllHeroesUseCase(),
         updateHeroUseCase: UpdateHeroProtocol = UpdateHeroUseCase(),
         removeHeroUseCase: RemoveHeroProtocol = RemoveHeroUseCase()) {
        self.heroes = heroes
        self.createHeroUseCase = createHeroUseCase
        self.fetchAllHeroesUseCase = fetchAllHeroesUseCase
        self.updateHeroUseCase = updateHeroUseCase
        self.removeHeroUseCase = removeHeroUseCase
        fetchAllHeroes()
    }
    
    func createHeroWith(nombre: String, primeraAparicion: String, imagen: String) {
        do {
            try createHeroUseCase.createHeroWith(nombre: nombre, primeraAparicion: primeraAparicion, imagen: imagen)
            fetchAllHeroes()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchAllHeroes() {
        do {
            heroes = try fetchAllHeroesUseCase.fetchAll()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func updateHeroWith(identifier: UUID, newNombre: String, newPrimeraAparicion: String?, newImagen: String?) {
        do {
            try updateHeroUseCase.updateHeroWith(identifier: identifier, nombre: newNombre, primeraAparicion: newPrimeraAparicion, imagen: newImagen)
            fetchAllHeroes()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func removeHeroWith(identifier: UUID) {
        do {
            try removeHeroUseCase.removeHeroWith(identifier: identifier)
            fetchAllHeroes()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
