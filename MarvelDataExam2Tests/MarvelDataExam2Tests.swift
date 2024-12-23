import XCTest
@testable import MarvelDataExam2

final class MarvelDataExam2Tests: XCTestCase {

    func testHeroDetailLocalInitialization() {
        let identifier = UUID()
        let nombre = "Spider-Man"
        let primeraAparicion = "Amazing Fantasy #15"
        let imagen = "https://example.com/spiderman.png"
        let createdAt = Date()
        
        let hero = HeroDetailLocal(
            identifier: identifier,
            nombre: nombre,
            primeraAparicion: primeraAparicion,
            imagen: imagen,
            createdAt: createdAt
        )
        
        XCTAssertEqual(hero.identifier, identifier)
        XCTAssertEqual(hero.nombre, nombre)
        XCTAssertEqual(hero.primeraAparicion, primeraAparicion)
        XCTAssertEqual(hero.imagen, imagen)
        XCTAssertEqual(hero.createdAt, createdAt)
    }
    
    func testHeroDetailLocalGetPrimeraAparicion() {
        let heroWithPrimeraAparicion = HeroDetailLocal(
            nombre: "Iron Man",
            primeraAparicion: "Tales of Suspense #39",
            imagen: nil,
            createdAt: Date()
        )
        XCTAssertEqual(heroWithPrimeraAparicion.getPrimeraAparicion, "Tales of Suspense #39")
        
        let heroWithoutPrimeraAparicion = HeroDetailLocal(
            nombre: "Thor",
            primeraAparicion: nil,
            imagen: nil,
            createdAt: Date()
        )
        XCTAssertEqual(heroWithoutPrimeraAparicion.getPrimeraAparicion, "")
    }
    
    func testHeroDetailLocalGetImagen() {
        let heroWithImagen = HeroDetailLocal(
            nombre: "Captain America",
            primeraAparicion: nil,
            imagen: "https://example.com/captainamerica.png",
            createdAt: Date()
        )
        XCTAssertEqual(heroWithImagen.getImagen, "https://example.com/captainamerica.png")
        
        let heroWithoutImagen = HeroDetailLocal(
            nombre: "Hulk",
            primeraAparicion: nil,
            imagen: nil,
            createdAt: Date()
        )
        XCTAssertEqual(heroWithoutImagen.getImagen, "")
    }
}
