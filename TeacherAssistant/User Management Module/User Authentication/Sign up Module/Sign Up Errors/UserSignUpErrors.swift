//
//  UserSignUpErrors.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import Foundation

enum UserSignUpErrors: Error {
    
    case firstNameEmpty
    case lastNameEmpty
    case phoneNumberEmpty
    case emailEmpty
    case passwordEmpty
    case invalidEmail
    case passwordTooShort
    case emailAlreadyInUse
    case unexpectedError
    case accountCreatedSuccessfully
    
    var localizedDescription: String {
        switch self {
        case .firstNameEmpty:
            return "First name is required."
        case .lastNameEmpty:
            return "Last name is required."
        case .emailEmpty:
            return "Email is required."
        case .passwordEmpty:
            return "Password is required."
        case .invalidEmail:
            return "Invalid email format."
        case .passwordTooShort:
            return "Password must contain at least 6 characters."
        case .emailAlreadyInUse:
            return "Email is already in use."
        case .unexpectedError:
            return "An unexpected error occurred."
        case .accountCreatedSuccessfully:
            return "Account created successfully."
        case .phoneNumberEmpty:
            return "Phone number is required."
        }
    }
}
