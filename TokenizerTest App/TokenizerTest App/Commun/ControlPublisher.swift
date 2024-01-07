//
//  ControlPublisher.swift
//  TokenizerTest App
//
//  Created by Nour-Eddine Legragui on 7/1/2024.
//

import Combine
import UIKit

struct ControlPublisher: Publisher {
    
    // MARK: - Typealias
    
    typealias Output = Void
    typealias Failure = Never

    // MARK: - Properties
    
    let control: UIControl
    let controlEvents: UIControl.Event

    // MARK: - Methods
    
    func receive<S>(subscriber: S) where S : Subscriber, S.Failure == Failure, S.Input == Output {
        let subscription = ControlSubscription(subscriber: subscriber, control: control, event: controlEvents)
        subscriber.receive(subscription: subscription)
    }
}
