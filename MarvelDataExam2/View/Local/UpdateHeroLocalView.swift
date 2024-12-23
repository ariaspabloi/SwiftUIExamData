import SwiftUI

struct UpdateHeroLocalView: View {
    
    var viewModel: HeroViewModel
    let identifier: UUID
    
    @State var nombre: String = ""
    @State var primeraAparicion: String = ""
    @State var imagen: String = ""
    
    @Environment(\.dismiss) private var dismiss
    

    var body: some View {
            VStack {
                Form {
                    Section {
                        TextField("", text: $nombre, prompt: Text("*Nombre"), axis: .vertical)
                        TextField("", text: $primeraAparicion, prompt: Text("*Primera aparición"), axis: .vertical)
                        TextField("", text: $imagen, prompt: Text("*URL de la imagen"), axis: .vertical)
                    }
                }
                Button(action: {
                    viewModel.removeHeroWith(identifier: identifier)
                    dismiss()
                }, label: {
                    Text("Eliminar héroe")
                        .foregroundStyle(.gray)
                        .underline()
                })
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .toolbar {
                ToolbarItem {
                    Button {
                        viewModel.updateHeroWith(identifier: identifier, newNombre: nombre, newPrimeraAparicion: primeraAparicion, newImagen: imagen)
                        dismiss()
                    } label: {
                        Text("Guardar")
                            .bold()
                    } .disabled(nombre == "")
                }
            }
            .navigationTitle("Modificar héroe")
        }
}

#Preview {
    NavigationStack {
        UpdateHeroLocalView(viewModel: .init(), identifier: .init(),
                            nombre: "Spider-Man", primeraAparicion: "Amazing Fantasy #15", imagen: "https://images-cdn.ubuy.co.in/634e342d8627ed3e29005beb-spider-man-marvel-comics-poster-print.jpg")
    }
}
