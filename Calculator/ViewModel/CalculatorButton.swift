//
//  NumberButton.swift
//  Calculator
//
//  Created by Duangcharoen  on 16/1/2567 BE.
//

import UIKit

class CalculatorButton: UIButton {

    private var label = UILabel()
    
    public func setup(labelText: String) {
        setupUI()
        setupLabel(labelText)
    }

}

private extension CalculatorButton {
    
    func setupUI() {
        self.tintColor = .clear
        self.backgroundColor = .random
        self.clipsToBounds = true
        
        //LAYOUT
        self.layoutIfNeeded()
        self.setNeedsLayout()
        print(self.frame.height)
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    func setupLabel(_ labelText: String) {
        label.text = labelText
        self.addSubview(label)
        self.label.font = .systemFont(ofSize: 30, weight: .regular)
    }
}
