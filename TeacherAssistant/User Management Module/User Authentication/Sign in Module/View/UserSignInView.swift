//
//  UserSignInView.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI
import AuthenticationServices

struct UserSignInView: View {
    @FocusState var focus: EmailSignInSection.FormFieldFocus?
    @EnvironmentObject var signInVM: UserSignInViewModel
    @EnvironmentObject var signUpVM: UserSignUpViewModel
    
    @Environment(\.colorScheme) var colorScheme  // Detect dark or light mode
    
    @State var showSignUpView: Bool = false
    
    var theme: AppColorScheme {
        colorScheme == .dark ? .dark : .light
    }
    
    @Binding var showSignInView: Bool
    
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
                            handleSignIn()
                        },
                        buttonTitle: "Sign in"
                    )
                    
                    LineDivider(dividerText: "or")
                    
                    ThirdPartyLoginViewItem(image: "Google", title: "Google", onButtonTapped: {
                        // Add sign in with Google here
                    })
                    ThirdPartyLoginViewItem(image: "Apple", title: "Apple", onButtonTapped: {
                        // add sign in with apple here
                    })
                    
                    HStack {
                        Text("Don't have an account?")
                            .foregroundStyle(theme.primaryText)
                        CustomTextualButton(onButtonTap: {
                            showSignUpView = true
                        }, title: "Sign up")
                    }
                    .padding()
                    Spacer()
                    
                }
                .padding(.top, 40)
            }
            .popover(isPresented: $showSignUpView) {
                UserSignUpView(showSignInView: showSignInView)
            }
        }
        
    }
    
    private func handleSignIn() {
        Task {
            do {
                let success = try await signInVM.signIn()
                if success {
                    
                }
            } catch {
                
            }
        }
    }
}

#Preview {
    UserSignInView(showSignInView: .constant(false))
        .environmentObject(UserSignInViewModel())
        .environmentObject(UserSignUpViewModel())
}
