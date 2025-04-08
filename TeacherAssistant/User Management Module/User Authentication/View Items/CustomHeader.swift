//
//  CustomHeader.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

/// A customizable header view that displays a title and two optional subtitles.
/// It dynamically adjusts its color scheme based on the current environment (light/dark mode).
struct CustomHeader: View {
    
    let title: String
    let subTitle1: String?
    let subTitle2: String?
    
    @Environment(\.colorScheme) var colorScheme  // Detect the current color scheme (light or dark)
    
    var theme: AppColorScheme {
        // Return the appropriate theme based on the current color scheme
        colorScheme == .dark ? .dark : .light
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            // Title styled with the accent color
            Text(title)
                .foregroundStyle(theme.accentColor)
                .font(.largeTitle)
                .bold()
            
            VStack(alignment: .leading) {
                // First subtitle with primary text color
                Text(subTitle1 ?? "")
                    .foregroundStyle(theme.primaryText)
                    .font(.title3)
                    .bold()
                
                // Second subtitle with secondary text color
                Text(subTitle2 ?? "")
                    .foregroundStyle(theme.secondaryText)
                    .font(.title3)
            }
        }
        .padding()
    }
}

#Preview {
    CustomHeader(title: "Let’s sign you in", subTitle1: "Your Personal Teaching Assistant", subTitle2: "Organize, manage, and grow with TA.")
}
