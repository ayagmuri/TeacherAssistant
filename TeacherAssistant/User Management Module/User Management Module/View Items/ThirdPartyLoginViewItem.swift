//
//  ThirdPartyLoginViewItem.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//


import SwiftUI

struct ThirdPartyLoginViewItem: View {
    let image: String
    let title: String
    var onButtonTapped: () -> Void
    
    var body: some View {
        
        Button {
            onButtonTapped()
        } label: {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Continue with \(title)")
                    .font(.headline)
            }
            .padding()
            .foregroundStyle(.dustyBlue)
            .frame(width: UIScreen.main.bounds.width * 0.85, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.dustyBlue)
                    
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
            )
            .shadow(color: .gray.opacity(0.1), radius: 6, x: 0, y: 4)
            
            
        }
    }
    
}

#Preview {
    ThirdPartyLoginViewItem(image: "Google", title: "Google", onButtonTapped: {})
}
