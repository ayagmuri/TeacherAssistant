//
//  GoogleSignInHelper.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-09.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseCore
import FirebaseAuth

protocol GoogleSignInHelperProtocol {
    
    func signInWithGoogle() async throws -> GoogleSignInResultModel
    
}

final class GoogleSignInHelper: GoogleSignInHelperProtocol, ObservableObject {
    
    enum AuthenticationError: Error {
        case clientIDError(message: String)
        case rootViewControllerError(message: String)
        case tokenError(message: String)
        case firebaseAuthError(message: String)
    }
    
    /// Signs in a user with Google authentication and Firebase.
    /// - Returns: A `GoogleSignInResultModel` containing the ID token and access token.
    @MainActor
    func signInWithGoogle() async throws -> GoogleSignInResultModel {
        // Step 1: Get the Firebase client ID
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            throw AuthenticationError.clientIDError(message: "No Client ID Found in Firebase Configuration")
        }
        
        // Step 2: Configure Google Sign-In
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Step 3: Get the root view controller
        guard let rootViewController = getRootViewController() else {
            throw AuthenticationError.rootViewControllerError(message: "Unable to find root view controller")
        }
        
        // Step 4: Perform Google Sign-In
        let signInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
        
        // Step 5: Extract ID token and access token
        guard let idTokenString = signInResult.user.idToken?.tokenString else {
            throw AuthenticationError.tokenError(message: "ID Token not found")
        }
        
        let accessToken = signInResult.user.accessToken.tokenString
        
        // Step 6: Authenticate with Firebase
        let credential = GoogleAuthProvider.credential(withIDToken: idTokenString, accessToken: accessToken)
        do {
            let result = try await Auth.auth().signIn(with: credential)
            _ = result.user
//            let firebaseUser = result.user
            // You can use `firebaseUser` for additional processing if needed
        } catch {
            throw AuthenticationError.firebaseAuthError(message: error.localizedDescription)
        }
        
        // Step 7: Return the tokens
        return GoogleSignInResultModel(idToken: idTokenString, accessToken: accessToken)
        
    }
    
    /// Helper method to get the root view controller.
    /// - Returns: The root view controller of the current window.
    @MainActor
    private func getRootViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            return nil
        }
        return rootViewController
    }
    
}
