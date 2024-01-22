//
//  ButtonRowView.swift
//  Calculator
//
//  Created by Duangcharoen on 21/1/2567 BE.
//

import UIKit

class ButtonRowView: UIView {
    
    func setup(backgroundColor: UIColor) -> UIView {
        setupUI( backgroundColor )
        return self
    }
    
}

private extension ButtonRowView {
    
    func setupUI(_ bg: UIColor) {
        self.backgroundColor = bg
        
        let buttonNames = [ "1","2","3","4","5" ]
        var buttons: [UIView] = []
        for buttonName in buttonNames {
            let button = CalculatorButton()
            button.setup(labelText: buttonName )

            buttons.append(button)
        }
        self.flex(.row).margin(10).build(views: buttons)
    }
}

