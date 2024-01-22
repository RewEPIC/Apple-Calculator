//
//  CalculatorView.swift
//  Calculator
//
//  Created by Duangcharoen  on 19/1/2567 BE.
//

import UIKit

class CalculatorView: UIView {
    let resultView = ResultView()
    let buttonView = ButtonView()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateRadius() {
        buttonView.updateRadius()
    }

}

private extension CalculatorView {
    
    func setup() {
        setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = .gray

        self.flex(.column).build(views: [
            resultView,
            buttonView
            
        ])
    }
    
    
}
