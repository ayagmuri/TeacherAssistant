//
//  SignOutButton.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-09.
//

import SwiftUI

struct SignOutButton: View {
    
    @Environment(\.colorScheme) var colorScheme // Detect dark or light mode
    
    var theme: AppColorScheme {
        colorScheme == .dark ? .dark : .light
    }
    var onButtonTapped: () -> Void
    
    var body: some View {
        Button {
            onButtonTapped()
        } label: {
            HStack{
                Text("Log Out")
                Image(systemName: "rectangle.portrait.and.arrow.right")
            }
            .bold()
            .foregroundStyle(theme.primaryText)
        }

    }
}

#Preview {
    SignOutButton(onButtonTapped: {})
}
