//
//  ButtonView.swift
//  Calculator
//
//  Created by Duangcharoen  on 19/1/2567 BE.
//

import UIKit

class ButtonView: UIView {

    var buttonRows: [ButtonRowView] = [
        ButtonRowView(backgroundColor: .black),
        ButtonRowView(backgroundColor:.gray),
        ButtonRowView(backgroundColor:.black),
        ButtonRowView(backgroundColor:.gray),
        ButtonRowView(backgroundColor:.black),
    ]

    public func setup() -> UIView {
        setupUI()
        return self
    }
    
    func setupUI() {
        self.backgroundColor = .black

        self.flex(.column).build(views: buttonRows)
    }
}
