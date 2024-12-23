import SwiftUI

struct HeroDetailRemoteView: View {
    @StateObject private var viewModel = HeroDetailViewModel()
    var heroId: Int
    var heroName: String
    
    var body: some View {
        VStack {
            if let hero = viewModel.detailedHero {
                AsyncImage(url: URL(string: hero.imagen)) { image in
                    image.resizable()
                         .scaledToFit()
                         .frame(width: 200, height: 200)
                } placeholder: {
                    ProgressView()
                        .frame(width: 200, height: 200)
                }
                
                Text(hero.nombre)
                    .font(.largeTitle)
                    .padding()
                
                Text("Real: \(hero.nombreReal)")
                    .font(.title2)
                    .padding()

                Text("Primera Aparición: \(hero.primeraAparicion)")
                    .font(.title3)
                    .padding()
                VStack(alignment: .leading){
                    Text("Historia: \(hero.historia)")
                        .font(.body)
                        .padding()

                    Text("Alias: \(hero.alias.joined(separator: ", "))")
                        .font(.body)
                        .padding()

                    Text("Poderes: \(hero.poderes.joined(separator: ", "))")
                        .font(.body)
                        .padding()

                    Text("Afiliaciones: \(hero.afiliaciones.joined(separator: ", "))")
                        .font(.body)
                        .padding()
                }
            } else {
                LoadingSpinner()
            }
        }
        .navigationTitle(heroName)
        .task {
            await viewModel.fetchHeroDetail(id: heroId)
        }
    }
}

#Preview {
    HeroDetailRemoteView(heroId: 1, heroName: "Hulk")
}
