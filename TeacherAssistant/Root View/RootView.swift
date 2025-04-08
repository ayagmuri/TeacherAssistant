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
    
    @State var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                Menu()
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                getAuthenticatedUser()
            }
        }
        .fullScreenCover(
            isPresented: $showSignInView) {
                UserSignInView(showSignInView: $showSignInView)
            }
    }
    
    private func getAuthenticatedUser() {
        showSignInView = !userAuthVM.authenticateUser()
    }
}

#Preview {
    RootView()
        .environmentObject(UserAuthenticationViewModel())
        .environmentObject(UserSignInViewModel())
        .environmentObject(UserSignUpViewModel())
}
