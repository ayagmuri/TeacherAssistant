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
    @FocusState.Binding var focus: FormFieldFocus?
    @ObservedObject var validator: PasswordValidator
    
    enum FormFieldFocus: Hashable {
        case firstName, lastName, phoneNumber, email, password
    }
    
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
            CustomSecureField(prompt: "Password", text: $password)
                .focused($focus, equals: .password)
            
            
            VStack {
                
                HStack (alignment: .firstTextBaseline) {
                    Text(validator.passwordStrength)
                        .multilineTextAlignment(.leading)
                        .bold()
                        .foregroundStyle(validator.passwordColor)  // Color based on password strength
                        .font(.caption)
                        .padding(.top, 4)
                    Spacer()
                }
                .padding()
            }
            
        }
        .onAppear(perform: {
            focus = .firstName
        })
        .padding()
    }
    
}

#Preview {
    struct PreviewWrapper: View {
        @State private var firstName = ""
        @State private var lastName = ""
        @State private var email = ""
        @State private var password = ""
        @State private var phoneNumber = ""
        @FocusState private var focus: SignUpFieldsSection.FormFieldFocus?
        @StateObject private var validator = PasswordValidator()
        
        var body: some View {
            SignUpFieldsSection(
                firstName: $firstName,
                lastName: $lastName,
                email: $email,
                password: $password,
                phoneNumber: $phoneNumber,
                focus: $focus, validator: validator
            )
        }
    }
    return PreviewWrapper()
}
