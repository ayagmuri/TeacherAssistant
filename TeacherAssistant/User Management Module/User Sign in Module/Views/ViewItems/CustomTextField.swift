//
//  CustomTextField.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

struct CustomTextField: View {
    let prompt: String
    @Binding var text: String
    

    var body: some View {
        VStack(alignment: .leading){
            TextField("",text: $text,prompt:Text(prompt)
                .foregroundStyle(.dustyBlue)
            )
            .textInputAutocapitalization(.never)
            .foregroundStyle(.dustyBlue)
            .padding()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.dustyBlue ,lineWidth: 1)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
        )
    }
}

#Preview {
    CustomTextField(prompt: "Email", text: .constant(""))
}
