import Foundation

protocol CreateHeroProtocol {
    func createHeroWith(nombre: String, primeraAparicion: String, imagen: String) throws
}


struct CreateHeroUseCase: CreateHeroProtocol {
    var heroDatabase: HeroDatabaseProtocol
    
    init(heroDatabase: HeroDatabaseProtocol = HeroDatabase.shared) {
        self.heroDatabase = heroDatabase
    }
    
    func createHeroWith(nombre: String, primeraAparicion: String, imagen: String) throws {
        let hero: HeroDetailLocal = .init(identifier: .init(),nombre: nombre, primeraAparicion: primeraAparicion, imagen: imagen, createdAt: .now)
        try heroDatabase.insert(hero: hero)
    }
}
