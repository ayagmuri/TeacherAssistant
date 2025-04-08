//
//  AuthenticationErrors.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import Foundation
import FirebaseAuth

enum AuthenticationErrors: Error, LocalizedError, CustomStringConvertible  {
    case invalidEmail
    case userNotFound
    case wrongPassword
    case userDisabled
    case emailAlreadyInUse
    case weakPassword
    case operationNotAllowed
    case idTokenExpired
    case userTokenExpired
    case invalidUserToken
    case requiresRecentLogin
    case popupClosedByUser
    case accountExistsWithDifferentCredential
    case credentialAlreadyInUse
    case unauthorizedDomain
    case invalidPhoneNumber
    case missingVerificationCode
    case invalidVerificationCode
    case quotaExceeded
    case networkError
    case tooManyRequests
    case unknown(Error)
    
    init(error: Error) {
        let errorCode = AuthErrorCode(_bridgedNSError: error as NSError)
        switch errorCode?.code {
        case .invalidEmail: self = .invalidEmail
        case .userNotFound: self = .userNotFound
        case .wrongPassword: self = .wrongPassword
        case .userDisabled: self = .userDisabled
        case .emailAlreadyInUse: self = .emailAlreadyInUse
        case .weakPassword: self = .weakPassword
        case .operationNotAllowed: self = .operationNotAllowed
        case .userTokenExpired: self = .userTokenExpired
        case .invalidUserToken: self = .invalidUserToken
        case .requiresRecentLogin: self = .requiresRecentLogin
        case .accountExistsWithDifferentCredential: self = .accountExistsWithDifferentCredential
        case .credentialAlreadyInUse: self = .credentialAlreadyInUse
        case .unauthorizedDomain: self = .unauthorizedDomain
        case .invalidPhoneNumber: self = .invalidPhoneNumber
        case .missingVerificationCode: self = .missingVerificationCode
        case .invalidVerificationCode: self = .invalidVerificationCode
        case .quotaExceeded: self = .quotaExceeded
        case .networkError: self = .networkError
        case .tooManyRequests: self = .tooManyRequests
        default: self = .unknown(error)
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .invalidEmail: return "Invalid email format."
        case .userNotFound: return "No account found with this email."
        case .wrongPassword: return "Incorrect password."
        case .userDisabled: return "This account has been disabled."
        case .emailAlreadyInUse: return "This email is already registered."
        case .weakPassword: return "Password is too weak."
        case .operationNotAllowed: return "This authentication method is not enabled."
        case .idTokenExpired: return "Your session has expired. Please log in again."
        case .userTokenExpired: return "Authentication token has expired."
        case .invalidUserToken: return "Invalid authentication token."
        case .requiresRecentLogin: return "Please re-authenticate to perform this action."
        case .popupClosedByUser: return "Authentication popup was closed before completion."
        case .accountExistsWithDifferentCredential: return "This email is registered with a different sign-in method."
        case .credentialAlreadyInUse: return "This credential is already associated with another account."
        case .unauthorizedDomain: return "Unauthorized domain. Check Firebase settings."
        case .invalidPhoneNumber: return "Invalid phone number format."
        case .missingVerificationCode: return "Verification code is missing."
        case .invalidVerificationCode: return "Incorrect verification code."
        case .quotaExceeded: return "SMS quota exceeded. Try again later."
        case .networkError: return "Network error. Please check your connection."
        case .tooManyRequests: return "Too many login attempts. Try again later."
        case .unknown(let error): return "Unknown error: \(error.localizedDescription)"
        }
    }
    
    var description: String {
        return errorDescription ?? "Unknown error occurred."
    }
}
