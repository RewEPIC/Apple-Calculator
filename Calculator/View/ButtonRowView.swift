//
//  ButtonRowView.swift
//  Calculator
//
//  Created by Duangcharoen on 21/1/2567 BE.
//

import UIKit

class ButtonRowView: UIView {

    let buttons: [CalculatorButton] = [ "1","2","3","4","5" ].map { CalculatorButton(labelText: $0) }

    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        setupUI(backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateRadius() {
        buttons.forEach {
            $0.roundedRadius()
        }
    }

}

private extension ButtonRowView {

    func setupUI(_ bg: UIColor) {
        self.backgroundColor = bg
        self.flex(.row).margin(10).build(views: buttons)

    }
}

