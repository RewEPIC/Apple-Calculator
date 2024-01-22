//
//  ButtonRowView.swift
//  Calculator
//
//  Created by Duangcharoen on 21/1/2567 BE.
//

import UIKit

class ButtonRowView: UIView {

    let buttons: [CalculatorButton] = [ "1","2","3","4","5" ].map { CalculatorButton(labelText: $0) }

    func setup(backgroundColor: UIColor) -> ButtonRowView {
        setupUI( backgroundColor )
        return self
    }

    func updateLayout() {
        buttons.forEach {
            $0.layoutIfNeeded()
            $0.setNeedsLayout()
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

