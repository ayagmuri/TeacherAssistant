//
//  AuthDataResultModel.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import Foundation
import FirebaseAuth

class AuthDataResultModel: Codable {
    
    let email: String?
    let uid: String?
    let photoURL: String?
    
    init(user: User) {
        email = user.email
        uid = user.uid
        photoURL = user.photoURL?.description
    }
}
