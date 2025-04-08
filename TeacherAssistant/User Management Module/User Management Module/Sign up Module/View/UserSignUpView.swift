//
//  UserSignUpView.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import SwiftUI

struct UserSignUpView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phoneNumber: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @FocusState var focus: SignUpFieldsSection.FormFieldFocus?
    @StateObject var validator: PasswordValidator = PasswordValidator()
    
    @Environment(\.colorScheme) var colorScheme  // Detect dark or light mode
    
    var theme: AppColorScheme {
        colorScheme == .dark ? .dark : .light
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                theme.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    CustomHeader(title: "Create Account" , subTitle1: "Simplify your teaching with TA", subTitle2: "Stay organized, stay focused- Let TA handle the rest.")
                    SignUpFieldsSection(
                        firstName: $firstName,
                        lastName: $lastName,
                        email: $email,
                        password: $password,
                        phoneNumber: $phoneNumber,
                        focus: $focus, validator: validator
                    )
                    .onChange(of: password) { oldValue, newValue in
                        validator.checkPassword(password)
                    }
                    
                    CustomButton(onButtonTapped: {}, buttonTitle: "Sign up")
                    
                    TermsAndPolicyBox(onTermsButtonTap: {}, onPrivacyButtonTap: {})
                }
            }
        }
    }
}

#Preview {
    UserSignUpView()
}
