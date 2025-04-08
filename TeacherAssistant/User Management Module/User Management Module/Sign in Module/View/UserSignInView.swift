//
//  UserSignInView.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI

struct UserSignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @FocusState var focus: EmailSignInSection.FormFieldFocus?
    
    @Environment(\.colorScheme) var colorScheme  // Detect dark or light mode
    
    var theme: AppColorScheme {
        colorScheme == .dark ? .dark : .light
    }
    
    var body: some View {
        ZStack {
            theme.backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                CustomHeader(
                    title: "Let’s sign you in",
                    subTitle1: "Your Personal Teaching Assistant",
                    subTitle2: "Organize, manage, and grow with TA."
                )
                
                EmailSignInSection(
                    email: $email,
                    password: $password,
                    focus: $focus,
                    forgotPassword: {
                    }
                )
                
                CustomButton(
                    onButtonTapped: {},
                    buttonTitle: "Sign in"
                )
                
                LineDivider(dividerText: "or")
      
                ThirdPartyLoginViewItem(image: "Google", title: "Google", onButtonTapped: {})
                ThirdPartyLoginViewItem(image: "Apple", title: "Apple", onButtonTapped: {})
                Spacer()
                HStack {
                    Text("Don't have an account?")
                        .foregroundStyle(theme.primaryText)
                    CustomTextualButton(onButtonTap: {}, title: "Sign up")
                }
                .padding()
                Spacer()
                
            }
            
            
            
        }
        
    }
}

#Preview {
    UserSignInView()
}
