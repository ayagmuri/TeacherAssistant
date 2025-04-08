//
//  AppColorScheme.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//

import Foundation
import SwiftUI

enum AppColorScheme {
    
    case light
    case dark
    
    var accentColor: Color {
        switch self {
        case .light:
            return .accentLM
        case .dark:
            return .accentDM
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .light:
            return .backGroundLM
        case .dark:
            return .backgroundDM
        }
    }
    
    var bordersShadowsColor: Color {
        switch self {
        case .light:
            return .bordersShadowsLM
        case .dark:
            return .bordersShadowsDM
        }
    }
    
    var primary: Color {
        switch self {
        case .light:
            return .primaryLM
        case .dark:
            return .primaryDM
        }
    }
    
    var secondary: Color {
        switch self {
        case .light:
            return .secondaryLM
        case .dark:
            return .secondaryDM
        }
    }
    
    var primaryText: Color {
        switch self {
        case .light:
            return .primaryTextLM
        case .dark:
            return .primaryTextDM
        }
    }
    
    var secondaryText: Color {
        switch self {
        case .light:
            return .secondaryTextLM
        case .dark:
            return .secondaryTextDM
        }
    }
    
    var Success: Color {
        switch self {
        case .light:
            return .successLM
        case .dark:
            return .successDM
        }
    }
    
    var warning: Color {
        switch self {
        case .light:
            return .warningLM
        case .dark:
            return .warningDM
        }
    }
}
