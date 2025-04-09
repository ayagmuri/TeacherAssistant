//
//  UserSignOutViewModel.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-09.
//

import Foundation
import FirebaseCore
import FirebaseAuth

protocol UserSignOutViewModelProtocol {
    func signOut() throws -> Bool
}


class UserSignOutViewModel: UserSignOutViewModelProtocol, ObservableObject {
    
    func signOut() throws -> Bool {
        do {
            // Sign out from Firebase
            try Authentication.shared.signOut()
            
            // Stop the authentication listener
            Authentication.shared.stopAuthListener()
            return true
        } catch {
            throw error
        }
    }
    
}
