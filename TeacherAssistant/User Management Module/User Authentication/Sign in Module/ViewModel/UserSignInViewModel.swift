//
//  UserSignInViewModel.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import Foundation
import AuthenticationServices
import FirebaseAuth


protocol UserSignInViewModelProtocol {
    var email: String { get set }
    var password: String { get set }
    
    var emailValidator: EmailValidator { get }
    
    func signInWithEmail() async throws -> Bool
    
}

class UserSignInViewModel: UserSignInViewModelProtocol, ObservableObject {
    
    @Published var email: String = ""
    
    @Published var password: String = ""
    
    /// Validator instance for checking email format validity.
    internal var emailValidator: EmailValidator = EmailValidator()
    
    
    
    
    /// Signs in an existing user using Firebase Authentication.
    ///
    /// This method validates the email and password before attempting authentication.
    /// If authentication is successful, it returns `true`; otherwise, it throws an error.
    ///
    /// - Throws: `UserSignInErrors` if email is empty, invalid, or user is not found.
    /// - Returns: `true` if sign-in is successful.
    @MainActor
    func signInWithEmail() async throws -> Bool {
        if email.isEmpty { throw UserSignInErrors.emailIsEmpty}
        if password.isEmpty { throw UserSignInErrors.passwordIsEmpty}
        if !emailValidator.isValidEmail(email) { throw UserSignInErrors.invalidEmail}
        
        do {
            try await Authentication.shared.signInWithEmail(email: email, password: password)
            clearFields()
            return true
            
        } catch {
            if (error as NSError).code == AuthErrorCode.userNotFound.rawValue  {
                throw UserSignInErrors.emailNotFound
            } else {
                throw UserSignInErrors.unexpectedError
            }
        }
    }
    
    func clearFields() {
        email = ""
        password = ""
    }
    
}
