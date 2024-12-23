import Foundation
import SwiftData

@Model
class HeroDetailLocal: Identifiable, Hashable {
    @Attribute(.unique) var identifier: UUID
    var nombre: String
    var primeraAparicion: String?
    var imagen: String?
    var createdAt: Date
    
    var getPrimeraAparicion: String{
        primeraAparicion ?? ""
    }
    
    var getImagen: String{
        imagen ?? ""
    }
    
    init(identifier: UUID = UUID(), nombre: String, primeraAparicion: String?, imagen: String?, createdAt: Date) {
        self.identifier = identifier
        self.nombre = nombre
        self.primeraAparicion = primeraAparicion
        self.imagen = imagen
        self.createdAt = createdAt
    }
}
