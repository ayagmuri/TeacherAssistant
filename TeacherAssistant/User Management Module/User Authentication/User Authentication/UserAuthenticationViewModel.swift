//
//  UserAuthentication.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import Foundation
import FirebaseAuth


protocol UserAuthenticationViewModelProtocol {
    
    func authenticateUser() -> Bool
    
    func reAuthenticateUser() -> Bool
}

class UserAuthenticationViewModel: UserAuthenticationViewModelProtocol, ObservableObject {
    

    func authenticateUser() -> Bool {
        if (try? Authentication.shared.getAuthenticatedUser()) != nil {
            return true
        }
        return false
    }
    
    func reAuthenticateUser() -> Bool {
        return false
    }
    
    
    
}
