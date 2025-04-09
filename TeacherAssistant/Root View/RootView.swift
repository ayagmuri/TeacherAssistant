//
//  RootView.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var userAuthVM: UserAuthenticationViewModel
    @EnvironmentObject var signInVM: UserSignInViewModel
    @EnvironmentObject var signUpVM: UserSignUpViewModel
    @EnvironmentObject var authUiStates: UserAuthUiStates
    
    var body: some View {
        ZStack {
            NavigationView {
                TabBarMenu()
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                getAuthenticatedUser()
            }
        }
        .fullScreenCover(
            isPresented: $authUiStates.showSignInView) {
                UserSignInView()
            }
    }
    
    private func getAuthenticatedUser() {
        authUiStates.showSignInView = !userAuthVM.authenticateUser()
    }
}

#Preview {
    RootView()
        .environmentObject(UserAuthenticationViewModel())
        .environmentObject(UserSignInViewModel())
        .environmentObject(UserSignUpViewModel())
        .environmentObject(UserAuthUiStates())
}
