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
    

//    var textPublisher: AnyPublisher<String, Never> {
//        ControlPublisher(control: self, controlEvents: .editingChanged)
//            .map { [weak self] in self?.text ?? "" }
//            .eraseToAnyPublisher()
//    }
    
//    /// Reactive Text Field
//    var textPublisher: AnyPublisher<String?, Never> {
//        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
//            .map { [weak self] _ in self?.text }
//            .eraseToAnyPublisher()
//    }
}
