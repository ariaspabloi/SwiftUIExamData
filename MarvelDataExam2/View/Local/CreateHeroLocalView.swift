import SwiftUI

struct CreateHeroLocalView: View {
    
    var viewModel: HeroViewModel
    @State var nombre: String = ""
    @State var primeraAparicion: String = ""
    @State var imagen: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("", text: $nombre, prompt: Text("*Nombre"), axis: .vertical)
                        .accessibilityIdentifier("createhero_nombre_identifier")
                    TextField("", text: $primeraAparicion, prompt: Text("Primera Aparición"), axis: .vertical)
                        .accessibilityIdentifier("createhero_primeraAparicion_identifier")
                    TextField("", text: $imagen, prompt: Text("URL de la imagen"), axis: .vertical)
                        .accessibilityIdentifier("createhero_imagen_identifier")
                } footer: {
                    Text("* El nombre es obligatorio")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cerrar")
                    }
                }
                ToolbarItem {
                    Button {
                        viewModel.createHeroWith(nombre: nombre, primeraAparicion: primeraAparicion, imagen: imagen)
                        dismiss()
                    } label: {
                        Text("Crear Héroe")
                            .bold()
                            .accessibilityIdentifier("createhero_button_identifier")
                    } .disabled(nombre == "")
                }
            }
            .navigationTitle("Nuevo Héroe")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    CreateHeroLocalView(viewModel: .init())
}
