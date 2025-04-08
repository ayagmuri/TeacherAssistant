//
//  TermsAndPolicyBox.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//


//
//  TermsAndPolicyBox.swift
//  MyIELTSScore
//
//  Created by Amin Yaghmouri on 2025-03-28.
//

import SwiftUI

struct TermsAndPolicyBox: View {
    
    var onTermsButtonTap: () -> Void
    var onPrivacyButtonTap: () -> Void
    
    
    var body: some View {
        VStack(spacing: 8) {
            Text("By signing up, you agree to our")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            HStack(spacing: 12) {
                Button(action: {
                    onTermsButtonTap()
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

                Button(action: {
                    onPrivacyButtonTap()
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
//        .frame(width: UIScreen.main.bounds.width * 0.8)
//        .background(Color(.systemGray6)) // Subtle background
        .cornerRadius(10)
    }
}

#Preview {
    TermsAndPolicyBox(onTermsButtonTap: {}, onPrivacyButtonTap: {})
}
