//
//  ThirdPartyLoginViewItem.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

/// A view item that represents a button for third-party login options.
/// It displays an image (representing a third-party service like Google, Facebook, etc.)
/// along with a label that says "Continue with <service name>".
struct ThirdPartyLoginViewItem: View {
   
    let image: String
    let title: String
    var onButtonTapped: () -> Void
    
    // Detects the current color scheme (dark or light mode)
    @Environment(\.colorScheme) var colorScheme
    
    // Determines the theme based on the current color scheme (dark or light)
    var theme: AppColorScheme {
        colorScheme == .dark ? .dark : .light
    }
    
    var body: some View {
        Button {
            onButtonTapped()  // Call the provided closure when the button is tapped
        } label: {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("Continue with \(title)")
                    .font(.headline)
            }
            .padding()
            .foregroundStyle(theme.primaryText)
            .frame(width: UIScreen.main.bounds.width * 0.85, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(theme.bordersShadowsColor)
                    
                    .background(RoundedRectangle(cornerRadius: 8).fill(theme.backgroundColor))
            )
        }
    }
}

#Preview {
    ThirdPartyLoginViewItem(image: "Google", title: "Google", onButtonTapped: {})
}
