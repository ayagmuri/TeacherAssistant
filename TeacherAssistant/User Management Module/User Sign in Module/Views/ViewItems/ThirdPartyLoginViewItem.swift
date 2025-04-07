import SwiftUI

struct ThirdPartyLoginViewItem: View {
    let image: String
    let title: String
    var onButtonTapped: () -> Void
    
    var body: some View {
        
        Button {
            onButtonTapped()
        } label: {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Continue with \(title)")
                    .font(.headline)
            }
            .modifier(ThirdPartLoginButtonModifier())
        }
    }
    
}

#Preview {
    ThirdPartyLoginViewItem(image: "Google", title: "Google", onButtonTapped: {})
}
