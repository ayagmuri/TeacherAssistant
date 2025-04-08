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
    @FocusState var focus: FormFieldFocus?
    @ObservedObject var passwordValidator: PasswordValidator
    
    var forgotPassword: () -> Void
    
    var body: some View {
        
        VStack (spacing: -25) {
            CustomTextField(prompt: "Email", text: $email)
                .focused($focus, equals: .email)
                .onSubmit {
                    focus = .password
                }
            CustomSecureField(prompt: "Password", text: $password, validator: passwordValidator)
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
    
    enum FormFieldFocus: Hashable {
        case email, password
    }
    
}

#Preview {
    EmailSignInSection(email: .constant(""), password: .constant(""), passwordValidator: PasswordValidator(), forgotPassword: {})
}
