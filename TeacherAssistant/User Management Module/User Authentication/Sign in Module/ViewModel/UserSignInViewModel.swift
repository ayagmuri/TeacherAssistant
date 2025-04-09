//
//  UserSignInViewModel.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import Foundation

protocol UserSignInViewModelProtocol {
    var email: String { get set }
    var password: String { get set }
    
    var emailValidator: EmailValidator { get }
    
    func signIn() async throws -> Bool
    
}

class UserSignInViewModel: UserSignInViewModelProtocol, ObservableObject {
    
    @Published var email: String = ""
    
    @Published var password: String = ""
    
    /// Validator instance for checking email format validity.
    internal var emailValidator: EmailValidator = EmailValidator()
    
    @MainActor
    func signIn() async throws -> Bool {
        
        return true
    }    
}
