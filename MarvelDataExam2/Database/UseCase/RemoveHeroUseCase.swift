import Foundation

protocol RemoveHeroProtocol {
    func removeHeroWith(identifier: UUID) throws
}

struct RemoveHeroUseCase: RemoveHeroProtocol {
    var heroDatabase: HeroDatabaseProtocol
    
    init(heroDatabase: HeroDatabaseProtocol = HeroDatabase.shared) {
        self.heroDatabase = heroDatabase
    }
    
    func removeHeroWith(identifier: UUID) throws {
        try heroDatabase.remove(identifier: identifier)
    }
}
