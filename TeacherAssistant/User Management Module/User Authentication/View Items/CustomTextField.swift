//
//  CustomTextField.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

/// A custom text field that supports user input with a dynamic appearance based on the current color scheme (light/dark mode).
/// The field includes a prompt that adjusts styling based on the theme and handles text binding.
struct CustomTextField: View {
    let prompt: String  // The prompt text to display as a placeholder
    @Binding var text: String  // The bound text for user input
    
    @Environment(\.colorScheme) var colorScheme  // Detect the current color scheme (light or dark)
    
    var theme: AppColorScheme {
        // Return the appropriate theme based on the current color scheme
        colorScheme == .dark ? .dark : .light
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // TextField for user input with the prompt displayed
            TextField(
                "",
                text: $text,
                prompt: Text(prompt)
                    .foregroundStyle(theme.secondaryText)
            )
            .textInputAutocapitalization(.never)  // Disable auto-capitalization for the text field
            .foregroundStyle(theme.primaryText)
            .padding()
        }
        .background(
        
            RoundedRectangle(cornerRadius: 8)
                .stroke(theme.bordersShadowsColor, lineWidth: 1)  // Set
                .frame(
                    width: UIScreen.main.bounds.width * 0.85,
                    height: 50
                )
        )
        .padding()
    }
}

#Preview {
    CustomTextField(prompt: "Email", text: .constant(""))
}
