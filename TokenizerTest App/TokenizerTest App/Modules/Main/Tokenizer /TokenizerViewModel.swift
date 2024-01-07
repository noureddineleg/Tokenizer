//
//  TokenizerViewModel.swift
//  TokenizerTest App
//
//  Created by Nour-Eddine Legragui on 7/1/2024.
//

import Foundation
import Combine

class TokenizerViewModel: BaseViewModel {
    
    // MARK: - Published Properties
    
    @Published var inputText: String = ""
    @Published var selectedLanguage: String = "English"
    
    // MARK: -
    
    lazy var outputText: AnyPublisher<String, Never> = {
        $inputText
            .removeDuplicates()
            .map { [weak self] text -> String in
                guard let self = self else { return "" }
                let delimiters = self.selectedLanguage == "English" ? ["if", "and"] : ["si", "y"]
                return text.tokenize(withDelimiters: delimiters)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }()
}
