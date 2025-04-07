import SwiftUI

struct LineDivider: View {
    
    let dividerText: String
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.2, height: 1)
                .foregroundStyle(.gray.opacity(0.5))
            Text(dividerText)
                .padding(.horizontal)
                .foregroundColor(.gray.opacity(0.5))
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.2, height: 1)
                .foregroundStyle(.gray.opacity(0.5))
        }
        .padding(.vertical)
    }
}


#Preview {
    LineDivider(dividerText: "Band Score")
}