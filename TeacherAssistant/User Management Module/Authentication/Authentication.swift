//
//  Authentication.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import Foundation
import AuthenticationServices
import FirebaseAuth

final class Authentication {
    
    /// Shared instance for global access.
    static let shared = Authentication()
    
    /// Private initializer to enforce singleton pattern.
    private init() {}
    
    private var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    
    
    func startAuthListener() {
            authStateListenerHandle = Auth.auth().addStateDidChangeListener { auth, user in
                if let user = user {
                    print("User is signed in: \(user.uid), email: \(user.email ?? "No Email")")
                } else {
                    print("User is signed out")
                }
            }
        }
        
        func stopAuthListener() {
            if let handle = authStateListenerHandle {
                Auth.auth().removeStateDidChangeListener(handle)
                authStateListenerHandle = nil
            }
        }
    
    
    
    /// Retrieves the currently authenticated user.
    ///
    /// - Returns: An `AuthDataResultModel` containing user authentication details.
    /// - Throws: An error if no user is authenticated.
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw AuthenticationErrors.userNotFound
        }
        return AuthDataResultModel(user: user)
    }
    
    /// Creates a new user account with an email and password.
    ///
    /// - Parameters:
    ///   - email: The email address of the new user.
    ///   - password: The password for the new account.
    /// - Returns: An `AuthDataResultModel` containing user authentication details.
    /// - Throws: An error if user creation fails.
    @discardableResult
    func createNewUser(email: String, password: String) async throws -> AuthDataResultModel {
        
        let authDataResult = try await  Auth.auth().createUser(withEmail: email, password: password)
       
        
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    /// Signs in an existing user with an email and password.
    ///
    /// - Parameters:
    ///   - email: The email address of the user.
    ///   - password: The password for the account.
    /// - Returns: An `AuthDataResultModel` containing user authentication details.
    /// - Throws: An error if authentication fails.
    @discardableResult
    func signInWithEmail(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    /// Signs out the currently authenticated user.
    ///
    /// - Throws: An error if sign-out fails.
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
