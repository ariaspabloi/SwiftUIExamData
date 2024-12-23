import SwiftUI

struct HeroRemoteView: View {
    @StateObject private var viewModel = APIDataViewModel()
    
    var body: some View {
        NavigationView {
            if let heroes = viewModel.heroes {
                List(heroes) { hero in
                    NavigationLink(destination: HeroDetailRemoteView(heroId: hero.id, heroName: hero.nombre)) {
                        HeroRow(nombre: hero.nombre, primeraAparicion: hero.primeraAparicion, imagen: hero.imagen)
                    }
                }
            }else{
                LoadingSpinner()
            }
        }
        .navigationTitle("Marvel Heroes")
        .task {
            await viewModel.fetchHeroes()
        }
    }
}

#Preview {
    HeroRemoteView()
}
