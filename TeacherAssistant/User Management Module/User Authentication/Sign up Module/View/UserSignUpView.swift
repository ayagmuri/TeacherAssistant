//
//  UserSignUpView.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import SwiftUI

struct UserSignUpView: View {

    @FocusState var focus: SignUpFieldsSection.FormFieldFocus?
    @StateObject var validator: PasswordValidator = PasswordValidator()
    
    @EnvironmentObject var signUpVM : UserSignUpViewModel
    
    @Environment(\.colorScheme) var colorScheme  // Detect dark or light mode
    
    var theme: AppColorScheme {
        colorScheme == .dark ? .dark : .light
    }
    
    @State var showSignInView: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                theme.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    CustomHeader(title: "Create Account" , subTitle1: "Simplify your teaching with TA", subTitle2: "Stay organized, stay focused- Let TA handle the rest.")
                    SignUpFieldsSection(
                        firstName: $signUpVM.firstName,
                        lastName: $signUpVM.lastName,
                        email: $signUpVM.email,
                        password: $signUpVM.password,
                        phoneNumber: $signUpVM.phoneNumber,
                        focus: $focus, validator: validator
                    )
                    
                 
                    CustomButton(onButtonTapped: {
                        handleSignUp()
                    }, buttonTitle: "Sign up")
                    
                    TermsAndPolicyBox(onTermsButtonTap: {}, onPrivacyButtonTap: {})
                }
            }
        }
        .onChange(of: signUpVM.password) { oldValue, newValue in
            validator.checkPassword(signUpVM.password)
        }
    }
    
    private func handleSignUp() {
        Task {
            do {
                showSignInView = try await signUpVM.signUp()
            } catch {
                print("Error happened")
            }
        }
    }
}

#Preview {
    UserSignUpView(showSignInView: false)
        .environmentObject(UserSignUpViewModel())
        
}
