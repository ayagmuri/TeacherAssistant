//
//  TermsAndPolicyBox.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import SwiftUI

/// A view component that displays terms of use and privacy policy links with a text statement.
/// It provides two buttons for the user to tap: one for "Terms of Use" and one for "Privacy Policy".
/// Both actions are handled by the provided closure callbacks.
struct TermsAndPolicyBox: View {
    
    // Closure for handling the Terms of Use button tap
    var onTermsButtonTap: () -> Void
    
    // Closure for handling the Privacy Policy button tap
    var onPrivacyButtonTap: () -> Void
    
    
    var body: some View {
        VStack(spacing: 8) {
            Text("By signing up, you agree to our")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            HStack(spacing: 12) {
                // Terms of Use button
                Button(action: {
                    onTermsButtonTap()  // Call the closure when the button is tapped
                }) {
                    Text("Terms of Use")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .underline()
                        .foregroundColor(.blue)
                }

                Text("|")
                    .font(.footnote)
                    .foregroundColor(.gray)

                // Privacy Policy button
                Button(action: {
                    onPrivacyButtonTap()  // Call the closure when the button is tapped
                }) {
                    Text("Privacy Policy")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .underline()
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .cornerRadius(10)
    }
}

#Preview {
    TermsAndPolicyBox(onTermsButtonTap: {}, onPrivacyButtonTap: {})
}
