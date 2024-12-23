import Foundation

protocol FetchAllHeroesProtocol {
    func fetchAll() throws -> [HeroDetailLocal]
}

struct FetchAllHeroesUseCase: FetchAllHeroesProtocol {
    var heroDatabase: HeroDatabaseProtocol
    
    init(heroDatabase: HeroDatabaseProtocol = HeroDatabase.shared) {
        self.heroDatabase = heroDatabase
    }
    
    func fetchAll() throws -> [HeroDetailLocal] {
        try heroDatabase.fetchAll()
    }
}
