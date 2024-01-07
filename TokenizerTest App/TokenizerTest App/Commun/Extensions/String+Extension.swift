//
//  String+Extension.swift
//  TokenizerTest App
//
//  Created by Nour-Eddine Legragui on 7/1/2024.
//

import Foundation

extension String {
    
    /// Tokenization method
    /// - Parameter delimiters: Input
    /// - Returns: String
    func tokenize(withDelimiters delimiters: [String]) -> String {
        
        // Create a regex pattern that matches any word or the specific delimiters
        let pattern = delimiters.map { NSRegularExpression.escapedPattern(for: $0) }.joined(separator: "|")
        let regexPattern = "(\\w+|\(pattern))"
        
        do {
            let regex = try NSRegularExpression(pattern: regexPattern)
            let matches = regex.matches(in: self, options: [], range: NSRange(startIndex..., in: self))
            
            var result = ""
            var isFirstToken = true
            
            for match in matches {
                let tokenRange = Range(match.range, in: self)!
                let token = String(self[tokenRange])
                
                // Check if the token is a delimiter, if so, prepend it with a newline and "-"
                if delimiters.contains(token), !isFirstToken {
                    result += "\n- \(token)"
                } else {
                    // If it's the first token, don't add "- ", otherwise, add a space
                    result += (isFirstToken ? "" : " ") + token
                    isFirstToken = false
                }
            }
            
            // If the result is not empty and doesn't start with "- ", prepend it
            if !result.isEmpty && !result.hasPrefix("- ") {
                result = "- " + result
            }
            
            return result
        } catch {
            print("Invalid regex: \(error.localizedDescription)")
            return ""
        }
    }
}
