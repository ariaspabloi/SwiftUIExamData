import Foundation

protocol UpdateHeroProtocol {
    func updateHeroWith(identifier: UUID, nombre: String, primeraAparicion: String?, imagen: String?) throws
}

struct UpdateHeroUseCase: UpdateHeroProtocol {
    var heroDatabase: HeroDatabaseProtocol
    
    init(heroDatabase: HeroDatabaseProtocol = HeroDatabase.shared) {
        self.heroDatabase = heroDatabase
    }
    
    func updateHeroWith(identifier: UUID, nombre: String, primeraAparicion: String?, imagen: String?) throws {
        try heroDatabase.update(identifier: identifier, nombre: nombre, primeraAparicion: primeraAparicion, imagen: imagen)
    }
}
