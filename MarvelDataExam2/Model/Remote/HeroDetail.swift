import Foundation

struct HeroDetail: Decodable {
    var id: Int
    var nombre: String
    var nombreReal: String
    var alias: [String]
    var poderes: [String]
    var primeraAparicion: String
    var historia: String
    var afiliaciones: [String]
    var imagen: String
}
