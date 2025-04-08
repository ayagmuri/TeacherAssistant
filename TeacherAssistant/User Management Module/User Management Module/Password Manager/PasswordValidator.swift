import SwiftUI
import Combine

/// A view model that evaluates the strength of a password and provides real-time feedback.
///
/// The class assesses the password based on its length, presence of numbers, uppercase letters,
/// and special characters. It assigns a strength label (e.g., "Weak", "Good", "Strong") and a corresponding color.
class PasswordValidator: ObservableObject {
    
    /// A text description of the current password strength (e.g., "Weak", "Good", "Strong").
    @Published var passwordStrength: String = ""
    
    /// A color that represents the strength of the password, used for visual feedback.
    @Published var passwordColor: Color = .gray
    
    /// Evaluates the strength of a given password and updates the `passwordStrength` and `passwordColor` properties.
    ///
    /// The strength is determined by:
    /// - Length of the password
    /// - Presence of numbers, uppercase letters, and special characters
    ///
    /// - Parameter password: The password string to be evaluated.
    func checkPassword(_ password: String) {
        let length = password.count
        
        // Checks if the password contains numbers, uppercase letters, and special characters
        let hasNumbers = password.rangeOfCharacter(from: .decimalDigits) != nil
        let hasUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        let hasSpecialChar = password.rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil
        
        // Determine strength based on password length and character combinations
        switch length {
        case 0:
            passwordStrength = ""
            passwordColor = .gray
        case 1..<6:
            passwordStrength = "Weak: Too short"
            passwordColor = .red
        case 6..<10 where hasNumbers || hasUppercase:
            passwordStrength = "Fair: Use special characters, numbers or uppercase"
            passwordColor = .orange
        case 10..<14 where hasNumbers && hasUppercase:
            passwordStrength = "Good: Use special characters"
            passwordColor = .blue
        case 14... where hasNumbers && hasUppercase && hasSpecialChar:
            passwordStrength = "Strong: Very secure"
            passwordColor = .green
        default:
            passwordStrength = "Moderate: Needs more variety"
            passwordColor = .yellow
        }
    }
}
