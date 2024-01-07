//
//  ReactiveTextField.swift
//  TokenizerTest App
//
//  Created by Nour-Eddine Legragui on 7/1/2024.
//

import Foundation

import UIKit
import Combine

class ReactiveTextField: UITextField {
    
    /// Reactive Text Field
    var textPublisher: AnyPublisher<String?, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { ($0.object as? UITextField)?.text }
            .eraseToAnyPublisher()
    }
}
