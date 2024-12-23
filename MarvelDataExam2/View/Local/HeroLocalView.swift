import SwiftUI

struct HeroLocalView: View {
    
    var viewModel: HeroViewModel = .init()
    @State var showCreateHero: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.heroes) { hero in
                    NavigationLink(destination:  UpdateHeroLocalView(viewModel: viewModel, identifier: hero.identifier, nombre: hero.nombre, primeraAparicion: hero.getPrimeraAparicion, imagen: hero.getImagen )) {
                        HeroRow(nombre: hero.nombre, primeraAparicion: hero.primeraAparicion, imagen: hero.imagen)
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let hero = viewModel.heroes[index]
                        viewModel.removeHeroWith(identifier: hero.identifier)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button(action: {
                        showCreateHero.toggle()
                    }, label: {
                        Label("Nuevo héroe", systemImage: "plus.circle")
                            .labelStyle(TitleAndIconLabelStyle())
                    })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .bold()
                    .accessibilityIdentifier("new_hero_button_identifier")
                }
            }
            .navigationTitle("Héroes")
            .fullScreenCover(isPresented: $showCreateHero, content: {
                CreateHeroLocalView(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    HeroLocalView(viewModel: .init(heroes: [
        .init(nombre: "Spider-Man", primeraAparicion: "Amazing Fantasy #15", imagen: nil, createdAt: .now),
        .init(nombre: "Iron Man", primeraAparicion: "Tales of Suspense #39", imagen: nil, createdAt: .now),
    ]))
}
