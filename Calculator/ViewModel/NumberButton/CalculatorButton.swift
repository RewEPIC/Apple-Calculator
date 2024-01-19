//
//  NumberButton.swift
//  Calculator
//
//  Created by Duangcharoen  on 16/1/2567 BE.
//

import UIKit

class CalculatorButton: UIButton {

    private var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

}

private extension CalculatorButton {
    
    func setup() {
        setupUI()
        setupLabel()
    }
    
    func setupUI() {
        self.tintColor = .clear
        self.backgroundColor = .gray
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.cornerCurve = .circular
    }
    
    func setupLabel() {
        self.addSubview(label)
        self.label.font = .systemFont(ofSize: 30, weight: .regular)
    }
}
