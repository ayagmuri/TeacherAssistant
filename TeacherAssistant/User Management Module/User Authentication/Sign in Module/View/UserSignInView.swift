//
//  UserSignInView.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI
import AuthenticationServices
import GoogleSignIn
import GoogleSignInSwift

struct UserSignInView: View {
    @FocusState var focus: EmailSignInSection.FormFieldFocus?
    @EnvironmentObject var signInVM: UserSignInViewModel
    @EnvironmentObject var signUpVM: UserSignUpViewModel
    
    @Environment(\.colorScheme) var colorScheme  // Detect dark or light mode
    
    @EnvironmentObject var authUiStates: UserAuthUiStates
    
    var theme: AppColorScheme {
        colorScheme == .dark ? .dark : .light
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                theme.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    CustomHeader(
                        title: "Let’s sign you in",
                        subTitle1: "Your Personal Teaching Assistant",
                        subTitle2: "Organize, manage, and grow with TA."
                    )
                    
                    EmailSignInSection(
                        email: $signInVM.email,
                        password: $signInVM.password,
                        focus: $focus,
                        forgotPassword: {
                        }
                    )
                    
                    CustomButton(
                        onButtonTapped: {
                            signInWithEmail()
                        },
                        buttonTitle: "Sign in"
                    )
                    
                    LineDivider(dividerText: "or")
                    
                    ThirdPartyLoginViewItem(image: "Google", title: "Google", onButtonTapped: {
                        // Add sign in with Google here
                        signInWithGoogle()
                    })
                    ThirdPartyLoginViewItem(image: "Apple", title: "Apple", onButtonTapped: {
                        // add sign in with apple here
                    })
                    
                    HStack {
                        Text("Don't have an account?")
                            .foregroundStyle(theme.primaryText)
                        CustomTextualButton(onButtonTap: {
                            authUiStates.showSignUpView = true
                        }, title: "Sign up")
                    }
                    .padding()
                    Spacer()
                    
                }
                .padding(.top, 40)
            }

            .popover(isPresented: $authUiStates.showSignUpView) {
                UserSignUpView()
            }
          
            // Alert
            .customAlert(message: authUiStates.alertMessage, showAlert: $authUiStates.showAlert, alertType: .error) {
               
            }
        }
       
        
    }
    
    // Function to sign in with email and password`
    private func signInWithEmail() {
        Task {
            do {
                let success = try await signInVM.signInWithEmail()
                if success {
                    authUiStates.showSignInView = false
                }
            } catch let error as UserSignInErrors {
                authUiStates.alertMessage = error.localizedDescription
                authUiStates.showAlert = true
            } catch {
                authUiStates.alertMessage = "Something went wrong. Please try again later."
                authUiStates.showAlert = true
            }
        }
    }
    
    
    // Function to sign in using Google authentication
    private func signInWithGoogle() {
        Task {
            do {
                let success = try await signInVM.signInWithGoogle()
                if success {
                    authUiStates.showSignInView = false
                }
            } catch let error as GoogleSignInErrors {
                authUiStates.alertMessage = error.localizedDescription
                authUiStates.showAlert = true
            } catch {
                authUiStates.alertMessage = GoogleSignInErrors.unexpectedError.localizedDescription
                authUiStates.showAlert = true
            }
        }
    }
}

#Preview {
    UserSignInView()
        .environmentObject(UserSignInViewModel())
        .environmentObject(UserSignUpViewModel())
        .environmentObject(UserAuthUiStates())
}
