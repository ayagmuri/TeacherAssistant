//
//  userAuthUiStates.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-09.
//

import Foundation

class UserAuthUiStates: ObservableObject {

    @Published var showSignInView: Bool = false
    @Published var showSignUpView: Bool = false
    
    // Alert States
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = "Error"
    @Published var alertMessage: String = ""
    @Published var alertButtonTitle: String = "Okay"
    
    
    // Alert States
    @Published var showSuccessAlert: Bool = false
    @Published var successAlertTitle: String = "Success 🎉"
    @Published var successAlertMessage: String = ""
    @Published var successAlertButtonTitle: String = "Let's Start"
    
    // Confirmation Dialog
    @Published var showConfirmationDialog: Bool = false
    @Published var confirmationDialogTitle: String = ""
    @Published var confirmationDialogMessage: String = ""
    @Published var confirmationDialogButtonText: String = ""
}
