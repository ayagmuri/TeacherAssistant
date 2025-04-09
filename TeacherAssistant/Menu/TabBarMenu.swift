//
//  Menu.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import SwiftUI

struct TabBarMenu: View {
    
    @EnvironmentObject var authUiStates: UserAuthUiStates
    
    var body: some View {
        NavigationView {
            TabView {
                Tab(
                    "Home",
                    systemImage: "house.fill") {
                        Text("Home")
                    }
                Tab(
                    "My Students",
                    systemImage: "person.3") {
                        Text("My students")
                    }
                Tab(
                    "Summary",
                    systemImage: "chart.bar.xaxis") {
                        Text("Summary")
                    }
                Tab(
                    "Finance",
                    systemImage: "dollarsign.bank.building") {
                        Text("Finance")
                    }
                
                Tab(
                    "Account",
                    systemImage: "person") {
                        UserProfileView()
                    }
            }
        }
    }
}

#Preview {
    TabBarMenu()
        .environmentObject(UserAuthUiStates())
    
}
