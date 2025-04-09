//
//  UserSignUpViewModel.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import Foundation
import FirebaseCore
import FirebaseAuth


protocol UserSignUpViewModelProtocol {
    
    var email: String { get set }
    var password: String { get set }
    
    var firstName: String { get set }
    var lastName: String { get set }
    var phoneNumber: String { get set }
    
    var emailValidator: EmailValidator { get }
    
    func signUp() async throws -> Bool
    
    func clearFields()
}

class UserSignUpViewModel: UserSignUpViewModelProtocol, ObservableObject {
    
    @Published var email: String = ""
    
    @Published var password: String = ""
    
    @Published var firstName: String = ""
    
    @Published var lastName: String = ""
    
    @Published var phoneNumber: String = ""
    
    /// Validator instance for checking email format validity.
    internal var emailValidator: EmailValidator = EmailValidator()
    
    @MainActor
    func signUp() async throws -> Bool {
        
        if firstName.isEmpty { throw UserSignUpErrors.firstNameEmpty}
        if lastName.isEmpty { throw UserSignUpErrors.lastNameEmpty}
        if phoneNumber.isEmpty { throw UserSignUpErrors.phoneNumberEmpty}
        if email.isEmpty { throw UserSignUpErrors.emailEmpty}
        if password.isEmpty { throw UserSignUpErrors.passwordEmpty}
        
        if !emailValidator.isValidEmail(email) { throw UserSignUpErrors.invalidEmail }
        
        if password.count < 6 {
            throw UserSignUpErrors.passwordTooShort
        }
        do {
            try await Authentication.shared.createNewUser(email: email, password: password)
            clearFields()
            return true
        } catch {
            if (error as NSError).code == AuthErrorCode.emailAlreadyInUse.rawValue {
                throw UserSignUpErrors.emailAlreadyInUse
            } else {
                throw UserSignUpErrors.unexpectedError
            }
        }
    }
    
    
    func clearFields() {
        email = ""
        password = ""
        firstName = ""
        lastName = ""
        phoneNumber = ""
    }
    
}
