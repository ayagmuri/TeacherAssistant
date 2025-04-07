//
//  ForgotPassword.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

struct CustomTextualButton: View {
    
    var onButtonTap: () -> Void
    
    var body: some View {
        VStack {
            Button {
                onButtonTap()
            } label: {
                Text("Forgot Password?")
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(.dustyBlue)
            }
        }
    }
}

#Preview {
    CustomTextualButton(onButtonTap: {})
}
