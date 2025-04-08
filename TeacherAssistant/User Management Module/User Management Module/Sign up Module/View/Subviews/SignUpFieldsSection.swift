//
//  SignUpFieldsSection.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import SwiftUI

struct SignUpFieldsSection: View {
    
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var password: String
    @Binding var phoneNumber: String
    @FocusState var focus: FormFieldFocus?
    
    
    var body: some View {
        VStack (spacing: -25) {
            CustomTextField(prompt: "First Name", text: $firstName)
                .focused($focus, equals: .firstName)
                .onSubmit {
                    focus = .lastName
                }
            
            CustomTextField(prompt: "Last Name", text: $lastName)
                .focused($focus, equals: .lastName)
                .onSubmit {
                    focus = .phoneNumber
                }
            
            CustomTextField(prompt: "phone Number", text: $phoneNumber)
                .focused($focus, equals: .phoneNumber)
                .onSubmit {
                    focus = .email
                }
            
            CustomTextField(prompt: "Email", text: $email)
                .focused($focus, equals: .email)
                .onSubmit {
                    focus = .password
                }
            CustomTextField(prompt: "Password", text: $password)
                .focused($focus, equals: .password)
        }
        .onAppear(perform: {
            focus = .firstName
        })
        .padding()
    }
    
    enum FormFieldFocus: Hashable {
        case firstName
        case lastName
        case email
        case password
        case phoneNumber
    }
}

#Preview {
    SignUpFieldsSection(firstName: .constant(""), lastName: .constant(""), email: .constant(""), password: .constant(""), phoneNumber: .constant(""))
}
