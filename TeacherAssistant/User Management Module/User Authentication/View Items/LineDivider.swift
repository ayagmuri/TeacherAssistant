//
//  LineDivider.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//


import SwiftUI

struct LineDivider: View {
    
    let dividerText: String
    
    @Environment(\.colorScheme) var colorScheme  // Detect dark or light mode
    
    var theme: AppColorScheme {
        colorScheme == .dark ? .dark : .light
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.3, height: 1)
                .foregroundStyle(.gray.opacity(0.5))
            Text(dividerText)
                .padding(.horizontal)
                .foregroundColor(.gray.opacity(0.5))
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.3, height: 1)
                .foregroundStyle(.gray.opacity(0.5))
        }
        .padding(.vertical)
        .foregroundStyle(theme.bordersShadowsColor)
    }
}


#Preview {
    LineDivider(dividerText: "or")
}
