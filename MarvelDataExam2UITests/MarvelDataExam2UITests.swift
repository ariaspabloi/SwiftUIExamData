import XCTest

final class MarvelDataExam2UITests: XCTestCase {

    func testNavigateToLocalViewAndCreateAndDisplayANewHero() throws {
        
        let app = XCUIApplication()
        app.launch()

        let localViewButton = app.buttons["localview_button_identifier"]

        XCTAssertTrue(localViewButton.exists, "The 'Ver información local' button does not exist.")
        
        localViewButton.tap()

        let heroLocalViewTitle = app.staticTexts["Héroes"]
        XCTAssertTrue(heroLocalViewTitle.exists, "Failed to navigate to the HeroLocalView.")
        
        let newHeroButton = app.buttons["new_hero_button_identifier"]
        
        XCTAssertTrue(newHeroButton.exists, "The 'Nuevo héroe' button does not exist.")
        
        newHeroButton.tap()

        let createHeroViewTitle = app.staticTexts["Nuevo Héroe"]
        XCTAssertTrue(createHeroViewTitle.exists, "Failed to navigate to the CreateHeroLocalView.")

        //CREATE HERO LOCAL VIEW
        let nombreField = app.textFields["createhero_nombre_identifier"]
        XCTAssertTrue(nombreField.exists, "The 'Nombre' text field does not exist.")
        
        nombreField.tap()
        nombreField.typeText("Spiderman")
        
        let primeraAparicionField = app.textFields["createhero_primeraAparicion_identifier"]
        XCTAssertTrue(primeraAparicionField.exists, "The 'Primera Aparición' text field does not exist.")
        primeraAparicionField.tap()
        primeraAparicionField.typeText("1962")

        let imagenField = app.textFields["createhero_imagen_identifier"]
        XCTAssertTrue(imagenField.exists, "The 'Imagen URL' text field does not exist.")
        imagenField.tap()
        imagenField.typeText("https://example.com/spiderman.png")

        let createHeroButton = app.buttons["createhero_button_identifier"]
        XCTAssertTrue(createHeroButton.exists, "The 'Crear Héroe' button does not exist.")
        XCTAssertTrue(createHeroButton.isEnabled, "The 'Crear Héroe' button should be enabled.")
        
        createHeroButton.tap()

        let heroListViewTitle = app.staticTexts["Héroes"]
        XCTAssertTrue(heroListViewTitle.exists, "Failed to navigate back to the HeroLocalView.")
        
        var newHeroCell = app.staticTexts["Spiderman"]
        XCTAssertTrue(newHeroCell.exists, "The new hero 'Spiderman' should appear in the hero list.")
        
        newHeroCell = app.staticTexts["1962"]
        XCTAssertTrue(newHeroCell.exists, "The new hero 'Spiderman' should appear in the hero list.")
    }
}
