//
//  GoogleSignInErrors.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-09.
//

import Foundation


enum GoogleSignInErrors: Error {
    
    
    case noClientIDFound
    case rootViewControllerNotFound
    case iDTokenNotFound
    case unexpectedError
    
    var localizedDescription: String {
        switch self {
        case .noClientIDFound:
            return  "No Client ID Found in Firebase Configuration"
        case .rootViewControllerNotFound:
            return  "Root View Controller Not Found"
        case .iDTokenNotFound:
            return "ID Token not found"
        case .unexpectedError:
            return "Something went wrong! Try later."
            
        }
    }
    
   
    
}
