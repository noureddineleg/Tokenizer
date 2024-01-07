//
//  ControlSubscription.swift
//  TokenizerTest App
//
//  Created by Nour-Eddine Legragui on 7/1/2024.
//

import Combine
import UIKit

class ControlSubscription<S: Subscriber, C: UIControl>: Subscription where S.Input == Void, S.Failure == Never {
    
    // MARK: - Properties
    
    var subscriber: S?
    private let control: C
    private let event: UIControl.Event
    
    // MARK: - Init
    
    init(subscriber: S, control: C, event: UIControl.Event) {
        self.subscriber = subscriber
        self.control = control
        self.event = event
        control.addTarget(self, action: #selector(eventHandler), for: event)
    }
    
    // MARK: - Methods
    
    func request(_ demand: Subscribers.Demand) {
        // We do not need to implement this because we're only sending events
    }
    
    func cancel() {
        control.removeTarget(self, action: #selector(eventHandler), for: event)
        subscriber = nil
    }
    
    // MARK: -
    
    @objc private func eventHandler() {
        _ = subscriber?.receive()
    }
}
