import SwiftUI

struct LoadingSpinner: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
                .padding(40)
        }
    }
}

#Preview{
    LoadingSpinner()
}
