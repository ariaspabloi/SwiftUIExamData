import Foundation

struct Hero: Identifiable, Decodable {
    var id: Int
    var nombre: String
    var primeraAparicion: String
    var imagen: String
}
