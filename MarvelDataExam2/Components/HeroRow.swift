import SwiftUI

struct HeroRow: View {
    let nombre: String
    let primeraAparicion: String?
    let imagen: String?
    
    var body: some View {
        HStack {
            if let urlString = imagen, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                Text(nombre)
                    .font(.headline)
                if let primeraAparicion = primeraAparicion {
                    Text(primeraAparicion)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

#Preview {
    HeroRow(
        nombre: "Spider-Man",
        primeraAparicion: "Amazing Fantasy #15",
        imagen: "https://example.com/spiderman.png"
    )
}
