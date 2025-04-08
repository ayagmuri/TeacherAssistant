//
//  CustomHeader.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

struct CustomHeader: View {
    let title: String
    let subTitle1: String?
    let subTitle2: String?
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 28){
            Text(title)
                .foregroundStyle(.darkPeach)
                .font(.largeTitle)
                .bold()
            VStack (alignment: .leading){
                Text(subTitle1 ?? "")
                    .foregroundStyle(.dustyBlue)
                    .font(.title3)
                    .bold()
                Text(subTitle2 ?? "")
                    .foregroundStyle(.dustyBlue.opacity(0.8))
                    .font(.title3)
            }
        }
        .padding()
    }
}

#Preview {
    CustomHeader(title: "Let’s sign you in", subTitle1: "Your Personal Teaching Assistant", subTitle2: "Organize, manage, and grow with TA.")
}
