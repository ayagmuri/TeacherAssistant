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
    
    @EnvironmentObject var authUiStates: UserAuthUiStates
    
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
            // Error Alert
            .customAlert(
                message: authUiStates.alertMessage,
                showAlert: $authUiStates.showAlert,
                alertType: .error,
                action: {
                    signUpVM.clearFields()
                }
            )
            // Sucess Alert 
            .customAlert(
                message: authUiStates.successAlertMessage,
                showAlert: $authUiStates.showSuccessAlert,
                alertType: .success,
                action: {
                    authUiStates.showSignInView = true
                }
            )
            

        }
        .onChange(of: signUpVM.password) { oldValue, newValue in
            validator.checkPassword(signUpVM.password)
        }
    }
    
    private func handleSignUp() {
        Task {
            do {
                authUiStates.alertMessage = UserSignUpErrors.accountCreatedSuccessfully.localizedDescription
              
                authUiStates.showAlert = try await signUpVM.signUp()
               
            } catch let error as UserSignUpErrors {
                authUiStates.alertMessage = error.localizedDescription
                authUiStates.showAlert = true
            } catch {
                authUiStates.alertMessage = UserSignUpErrors.unexpectedError.localizedDescription
                authUiStates.showAlert = true
            }
        }
    }
}

#Preview {
    UserSignUpView()
        .environmentObject(UserSignUpViewModel())
        .environmentObject(UserAuthUiStates())
        
}
