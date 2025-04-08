//
//  EmailSignInSection.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

struct EmailSignInSection: View {
    
    @Binding var email: String
    @Binding var password: String
    
    @FocusState.Binding var focus: FormFieldFocus?
    enum FormFieldFocus: Hashable {
        case email, password
    }
    var forgotPassword: () -> Void
    
    var body: some View {
        
        VStack (spacing: -25) {
            CustomTextField(prompt: "Email", text: $email)
                .focused($focus, equals: .email)
                .onSubmit {
                    focus = .password
                }
            CustomSecureField(prompt: "Password", text: $password)
                .focused($focus, equals: .password)
                .padding(.bottom)
            HStack {
                Spacer()
                CustomTextualButton(onButtonTap: {
                    forgotPassword()
                }, title: "Forgot Password?")
            }
            .padding(.trailing)
        }
        .padding()
        .onAppear {
            focus = .email
        }
    }
    
   
    
}

#Preview {
    struct PreviewWrapper: View {
        @State private var email = ""
        @State private var password = ""
        @FocusState private var focus: EmailSignInSection.FormFieldFocus?
       

        var body: some View {
            EmailSignInSection(
                email: $email,
                password: $password,
                
                focus: $focus,
                forgotPassword: {
                }
            )
        }
    }
    return PreviewWrapper()
}
