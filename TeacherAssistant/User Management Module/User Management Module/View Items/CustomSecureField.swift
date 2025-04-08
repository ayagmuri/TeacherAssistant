//
//  CustomSecureField.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

/// A custom secure text field that integrates password strength validation.
/// This view dynamically adjusts its appearance based on the current color scheme (light/dark mode).
/// It also displays the password strength using a `PasswordValidator` object.
struct CustomSecureField: View {
    
    let prompt: String
    @Binding var text: String
    
    @Environment(\.colorScheme) var colorScheme  // Detect the current color scheme (light or dark)
    
    var theme: AppColorScheme {
        // Return the appropriate theme based on the current color scheme
        colorScheme == .dark ? .dark : .light
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // SecureField to enter the password with a prompt
            SecureField(
                "",
                text: $text,
                prompt: Text(prompt)
                    .foregroundStyle(theme.primaryText)
            )
            .textInputAutocapitalization(.never)  // Disable text auto-capitalization for password fields
            .foregroundStyle(theme.primaryText)
            .padding()
            
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(theme.bordersShadowsColor, lineWidth: 1)
                .frame(width: UIScreen.main.bounds.width * 0.85, height: 50) // Set width and height
        )
        .padding()
    }
}

#Preview {
    // Preview setup with sample data for CustomSecureField
    CustomSecureField(prompt: "password", text: .constant(""))
}
