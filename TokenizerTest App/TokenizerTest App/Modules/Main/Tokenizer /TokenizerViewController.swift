//
//  TokenizerViewController.swift
//  TokenizerTest App
//
//  Created by Nour-Eddine Legragui on 7/1/2024.
//

import UIKit
import Combine

class TokenizerViewController: BaseViewController {
    
    // MARK: - Views
    @IBOutlet weak var textField: ReactiveTextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var languageSelector: UISegmentedControl!
    
    // MARK: - Properties
    
    var viewModel: TokenizerViewModel!
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

