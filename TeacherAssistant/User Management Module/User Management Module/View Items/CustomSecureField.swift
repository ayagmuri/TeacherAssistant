//
//  CustomSecureField.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

struct CustomSecureField: View {
    
    let prompt: String
    @Binding var text: String
    @ObservedObject var validator: PasswordValidator
    
    var body: some View {
        VStack(alignment: .leading){
            SecureField(
                "",
                text: $text,
                prompt: Text(prompt)
                    .foregroundStyle(.dustyBlue)
            )
            .textInputAutocapitalization(.never)
            .foregroundStyle(.dustyBlue)
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.dustyBlue ,lineWidth: 1)
                .frame(width: UIScreen.main.bounds.width * 0.85 ,height: 50)
        )
        .padding()
        Text(validator.passwordStrength)
            .foregroundStyle(validator.passwordColor)
            .font(.caption)
            .padding(.top, 4)
    }
    
}

#Preview {
    CustomSecureField(prompt: "password", text: .constant(""), validator: PasswordValidator())
}
