//
//  EmailValidatorProtocol.swift
//  TeacherAssistant
//
//  Created by Amin Yaghmouri on 2025-04-08.
//


//
//  EmailValidator.swift
//  MyIELTSScore
//
//  Created by Amin Yaghmouri on 2025-04-03.
//

import Foundation

protocol EmailValidatorProtocol {
    func isValidEmail(_ email: String) -> Bool
    
}

class EmailValidator: EmailValidatorProtocol, ObservableObject {
    
    /// Validates whether a given email string is in a proper email format.
    /// - Parameter email: The email address to validate.
    /// - Returns: `true` if the email is valid, otherwise `false`.
    func isValidEmail(_ email: String) -> Bool {
        
        /// Regular expression pattern for standard email validation.
        /// Breakdown:
        /// - `[A-Z0-9a-z._%+-]+` → Matches the local part (before `@`).
        /// - `@` → Ensures the `@` symbol is present.
        /// - `[A-Za-z0-9.-]+` → Matches the domain name (e.g., `gmail.com`).
        /// - `\\.` → Ensures a dot (`.`) before the TLD.
        /// - `[A-Za-z]{2,}` → Matches at least **two** alphabetic characters (e.g., `.com`, `.net`).
        let regexPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        /// Uses `NSPredicate` to evaluate if the email string matches the regex pattern.
        /// - Returns `true` if the email format is correct, otherwise `false`.
        let regexTest = NSPredicate(format: "SELF MATCHES %@", regexPattern).evaluate(with: email)

        /// Creates an `NSDataDetector` to scan for links in the email string.
        /// - `NSTextCheckingResult.CheckingType.link.rawValue`: Detects links, including `mailto:` email addresses.
        /// - `try?` ensures that if `NSDataDetector` initialization fails, it safely returns `nil`.
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)

        /// Searches for link-like elements (e.g., URLs or emails) within the `email` string.
        /// - `range`: The full range of the email string in UTF-16 encoding.
        /// - Returns: An array of detected link matches (if any).
        let matches = detector?.matches(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count))

        /// Returns `true` if:
        /// - The email matches the **regex pattern** (`regexTest`).
        /// - The `NSDataDetector` detects it as an **email address** (not just a URL), by checking for `mailto:` scheme.
        return regexTest && matches?.first?.url?.scheme == "mailto"
    }
    
}
