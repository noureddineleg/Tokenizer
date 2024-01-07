//
//  UINib+Extension.swift
//  TokenizerTest App
//
//  Created by Nour-Eddine Legragui on 7/1/2024.
//

import UIKit

extension UINib {
    
    /// Load Nib with name
    ///
    /// - Parameter nibName: Nib name
    /// - Returns: UINib
    static func nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
}
