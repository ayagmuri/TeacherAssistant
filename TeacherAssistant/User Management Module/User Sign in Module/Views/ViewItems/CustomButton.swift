//
//  CustomButton.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

struct CustomButton: View {
    
    var onButtonTapped: () -> Void
    let buttonTitle: String
    
    var body: some View {
        VStack {
            Button {
                onButtonTapped()
            } label: {
                Text(buttonTitle)
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: 50)
                    .background(.dustyBlue)
                    .cornerRadius(8)
                    
            }
            .padding()

        }
        
    }
}

#Preview {
    CustomButton(onButtonTapped: {}, buttonTitle: "Sign in")
}
