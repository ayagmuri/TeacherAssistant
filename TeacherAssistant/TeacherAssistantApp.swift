//
//  TeacherAssistantApp.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-07.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TeacherAssistantApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var userAuthVM: UserAuthenticationViewModel = UserAuthenticationViewModel()
    @StateObject private var signInVM: UserSignInViewModel = UserSignInViewModel()
    @StateObject private var signUpVM: UserSignUpViewModel = UserSignUpViewModel()
    @StateObject var authUiStates: UserAuthUiStates = UserAuthUiStates()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RootView()
            }
            .environmentObject(userAuthVM)
            .environmentObject(signInVM)
            .environmentObject(signUpVM)
            .environmentObject(authUiStates)
        }
    }
}
