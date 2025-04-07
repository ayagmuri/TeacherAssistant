//
//  ForgotPassword.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

struct CustomTextualButton: View {
    
    var onButtonTap: () -> Void
    let title: String
    
    var body: some View {
        VStack {
            Button {
                onButtonTap()
            } label: {
                Text(title)
                    .font(.subheadline)
                    .bold()
            }
        }
    }
}

#Preview {
    CustomTextualButton(onButtonTap: {}, title: "Forgot Password?")
}
