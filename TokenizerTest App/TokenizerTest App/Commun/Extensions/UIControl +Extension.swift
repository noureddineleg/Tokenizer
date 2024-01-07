//
//  UIControl+Extension.swift
//  TokenizerTest App
//
//  Created by Nour-Eddine Legragui on 7/1/2024.
//

import UIKit
import Combine

extension UIControl {
    
    /// Creating a publisher for any control event.
    /// - Parameter events: event
    /// - Returns: description
    func publisher(for events: UIControl.Event) -> AnyPublisher<Void, Never> {
        return ControlPublisher(control: self, controlEvents: events)
            .map { _ in }
            .eraseToAnyPublisher()
    }
}
