//
//  NumberButton.swift
//  Calculator
//
//  Created by Duangcharoen  on 16/1/2567 BE.
//

import UIKit

class CalculatorButton: UIButton {

    private var label = UILabel()

    init(labelText: String) {
        super.init(frame: .zero)
        setupUI()
        setupLabel(labelText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func roundedRadius() {
        self.layer.cornerRadius = self.frame.height / 2
    }
}

private extension CalculatorButton {
    
    func setupUI() {
        self.tintColor = .clear
        self.backgroundColor = .random
        self.clipsToBounds = true
        
    }

    func setupLabel(_ labelText: String) {
        label.text = labelText
        self.addSubview(label)
        self.label.font = .systemFont(ofSize: 30, weight: .regular)
    }
}
