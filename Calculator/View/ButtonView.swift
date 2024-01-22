//
//  ButtonView.swift
//  Calculator
//
//  Created by Duangcharoen  on 19/1/2567 BE.
//

import UIKit

class ButtonView: UIView {

    var buttonRows: [ButtonRowView] = [
        ButtonRowView().setup(backgroundColor: .black),
        ButtonRowView().setup(backgroundColor: .gray),
        ButtonRowView().setup(backgroundColor: .black),
        ButtonRowView().setup(backgroundColor: .gray),
        ButtonRowView().setup(backgroundColor: .black),
    ]

    public func setup() -> UIView {
        setupUI()
        return self
    }
    
    func setupUI() {
        self.backgroundColor = .black

        self.flex(.column).build(views: buttonRows)
        buttonRows.forEach {
            $0.updateLayout()
        }
    }
}
