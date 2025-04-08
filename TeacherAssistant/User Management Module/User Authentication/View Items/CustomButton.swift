//
//  CustomButton.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

/// A customizable button view that adapts its appearance based on the current color scheme (light/dark mode).
///
/// This button takes a title and an action to be triggered when tapped.
struct CustomButton: View {
    
    /// Closure that is executed when the button is tapped.
    var onButtonTapped: () -> Void
    
    /// The title displayed on the button.
    let buttonTitle: String
    
    /// Environment value to detect the current color scheme (light or dark mode).
    @Environment(\.colorScheme) var colorScheme
    
    /// Returns the appropriate color scheme for the button based on the current environment (light or dark mode).
    var theme: AppColorScheme {
        colorScheme == .dark ? .dark : .light
    }
    
    var body: some View {
        VStack {
            Button {
                // Executes the action when the button is tapped
                onButtonTapped()
            } label: {
                Text(buttonTitle)
                    .foregroundStyle(.white)  // Button text color is white
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: 50)
                    .background(theme.primary)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
}

#Preview {
    CustomButton(onButtonTapped: {}, buttonTitle: "Sign in")
}
