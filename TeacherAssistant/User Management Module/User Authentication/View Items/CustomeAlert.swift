//
//  CustomeAlert.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-09.
//

import SwiftUI

struct CustomeAlert: ViewModifier {
    
    let message: String
    @Binding var showAlert: Bool
    var action: () -> Void
    var alertType: AlertType
    
    enum AlertType : String{
        case success = "Success 🎉"
        case error = "Error"
        
        var buttonTitle : String {
            switch self {
            case .success:
                return "Let's Start"
            case .error:
                return "OK"
            }
        }
    }
    
    func body(content: Content) -> some View {
        content.alert(
            alertType.rawValue,
            isPresented: $showAlert) {
                Button(alertType.buttonTitle, role: .cancel) {
                    action()
                }
            } message: {
                Text(message)
            }
    }
}

extension View {
    func customAlert (
        message: String,
        showAlert: Binding<Bool>,
        alertType: CustomeAlert.AlertType,
        action: @escaping () -> Void
        ) -> some View {
            self.modifier(CustomeAlert(message: message, showAlert: showAlert, action: action, alertType: alertType))
    }
}
