import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("home")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: HeroRemoteView()) {
                            Text("Ver información desde la API")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.btnPrimaryColor)
                                .cornerRadius(10)
                                .accessibilityIdentifier("remoteview_button_identifier")
                        }

                        NavigationLink(destination: HeroLocalView()) {
                            Text("Ver información local")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.btnSecondaryColor)
                                .cornerRadius(10)
                                .accessibilityIdentifier("localview_button_identifier")
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                }
            }
        }
    }

}

#Preview {
    ContentView()
}
