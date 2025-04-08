//
//  UserSignUpView.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import SwiftUI

struct UserSignUpView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phoneNumber: String = ""
    @State var email: String = ""
    @State var password: String = ""
  
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.ivoryCloud.edgesIgnoringSafeArea(.all)
                VStack {
                    CustomHeader(title: "Create Account" , subTitle1: "Simplify your teaching with TA", subTitle2: "Stay organized, stay focused- Let TA handle the rest.")
                    SignUpFieldsSection(
                        firstName: $firstName,
                        lastName: $lastName,
                        email: $email,
                        password: $password,
                        phoneNumber: $phoneNumber
                    )
                    CustomButton(onButtonTapped: {}, buttonTitle: "Sign up")
                    
                    TermsAndPolicyBox(onTermsButtonTap: {}, onPrivacyButtonTap: {})
                }
            }
        }
    }
}

#Preview {
    UserSignUpView()
}
