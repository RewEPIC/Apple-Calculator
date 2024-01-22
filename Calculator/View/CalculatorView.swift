//
//  CalculatorView.swift
//  Calculator
//
//  Created by Duangcharoen  on 19/1/2567 BE.
//

import UIKit

class CalculatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CalculatorView {
    
    func setup() {
        setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = .gray
        
        let resultView = ResultView().setup()
        let buttonView = ButtonView().setup()
        
        self.flex(.column).build(views: [
            resultView,
            buttonView
            
        ])
    }
    
    
}
