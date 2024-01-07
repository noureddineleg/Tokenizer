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
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var languageSelector: UISegmentedControl!
    
    // MARK: - Properties
    
    var viewModel: TokenizerViewModel!
    
    // MARK: -
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TokenizerViewModel()
        setupBindings()
    }
    
    // MARK: - Private Methods

    private func setupBindings() {
        
        // Bind text field
        textField.textPublisher
            .compactMap { $0 }
            .sink { [weak self] text in
                self?.viewModel.inputText = text
            }
            .store(in: &cancellables)
        
        // Bind output
        viewModel.outputText
            .receive(on: RunLoop.main)
            .sink { [weak outputLabel] text in
                outputLabel?.text = text
            }
            .store(in: &cancellables)
        
        // Bind language selection
        languageSelector.publisher(for: .valueChanged)
            .map { [weak self] _ in
                self?.languageSelector.selectedSegmentIndex == 0 ? "English" : "Spanish"
            }
            .assign(to: \.selectedLanguage, on: viewModel)
            .store(in: &cancellables)
        
        // Initialize with the current selection
        viewModel.selectedLanguage = languageSelector.selectedSegmentIndex == 0 ? "English" : "Spanish"
    }
}
