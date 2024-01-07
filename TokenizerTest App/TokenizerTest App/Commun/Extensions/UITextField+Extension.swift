//
//  UITextField+Extension.swift
//  TokenizerTest App
//
//  Created by Nour-Eddine Legragui on 7/1/2024.
//

import UIKit
import Combine

extension UITextField {
    
    /// Text Publisher Listner
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { [weak self] _ in self?.text }
            .eraseToAnyPublisher()
    }
}
