//
//  UserProfileView.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-09.
//

import SwiftUI

struct UserProfileView: View {
    
    @StateObject var signOutVM = UserSignOutViewModel()
    @EnvironmentObject var authUiStates: UserAuthUiStates
    
    var body: some View {
        NavigationView {
            VStack{
                SignOutButton {
                    handleSignOut()
                }
            }
        }
    }
    
    private func handleSignOut() {
        Task {
            do {
                authUiStates.showSignInView = try signOutVM.signOut()
            } catch {
                throw error
            }
        }
    }
}

#Preview {
    UserProfileView()
        .environmentObject(UserAuthUiStates())
}
