
import SwiftUI
import Combine

class PasswordValidator: ObservableObject {
    
    @Published var passwordStrength: String = ""
    @Published var passwordColor: Color = .gray
    
    func checkPassword(_ password: String) {
        let length = password.count
        let hasNumbers = password.rangeOfCharacter(from: .decimalDigits) != nil
        let hasUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        let hasSpecialChar = password.rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil

        switch length {
        case 0:
            passwordStrength = ""
            passwordColor = .gray
        case 1..<6:
            passwordStrength = "Weak"
            passwordColor = .red
        case 6..<10 where hasNumbers || hasUppercase:
            passwordStrength = "Fair"
            passwordColor = .orange
        case 10..<14 where hasNumbers && hasUppercase:
            passwordStrength = "Good"
            passwordColor = .blue
        case 14... where hasNumbers && hasUppercase && hasSpecialChar:
            passwordStrength = "Strong"
            passwordColor = .green
        default:
            passwordStrength = "Moderate"
            passwordColor = .yellow
        }
    }
}
