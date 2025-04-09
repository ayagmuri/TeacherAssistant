//
//  UserSignInErrors.swift
//  MyIELTSScore
//
//  Created by Amin Yaghmouri on 2025-03-31.
//

import Foundation

enum UserSignInErrors: Error {
    

    case invalidEmail
    case emailNotFound
    case emailIsEmpty
    case passwordIsEmpty
    case wrongPassword
    case passwordTooWeak
    case emailAlreadyInUse
    case tooManyRequests
    case networkError
    case googleSignInFailed
    case invalidGoogleToken
    case googleAccountNotLinked
    case appleSignInFailed
    case invalidAppleToken
    case appleAccountNotLinked
    case facebookSignInFailed
    case invalidFacebookToken
    case facebookAccountNotLinked
    case serverError
    case timeoutError
    case unexpectedError
    case signInSuccessful

    var localizedDescription: String {
        switch self {
        case .invalidEmail:
            return "Invalid email format."
        case .emailNotFound:
            return "Email or password is incorrect.`"
        case .wrongPassword:
            return "Email or password is incorrect."
        case .passwordTooWeak:
            return "Your password is too weak."
        case .emailAlreadyInUse:
            return "This email is already associated with another account."
        case .tooManyRequests:
            return "Too many login attempts. Please try again later."
        case .networkError:
            return "Network error. Please check your connection."
        case .googleSignInFailed:
            return "Google sign-in failed. Please try again."
        case .invalidGoogleToken:
            return "Invalid Google authentication token."
        case .googleAccountNotLinked:
            return "No account linked to this Google profile."
        case .appleSignInFailed:
            return "Apple sign-in failed. Please try again."
        case .invalidAppleToken:
            return "Invalid Apple authentication token."
        case .appleAccountNotLinked:
            return "No account linked to this Apple ID."
        case .facebookSignInFailed:
            return "Facebook sign-in failed. Please try again."
        case .invalidFacebookToken:
            return "Invalid Facebook authentication token."
        case .facebookAccountNotLinked:
            return "No account linked to this Facebook profile."
        case .serverError:
            return "Server error. Please try again later."
        case .timeoutError:
            return "Request timed out. Please try again."
        case .unexpectedError:
            return "An unknown error occurred."
        case .signInSuccessful:
            return "Welcome! You have successfully signed in."
        case .emailIsEmpty:
            return "Email is empty."
        case .passwordIsEmpty:
            return "Password is empty."
        }
    }
}

