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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .black

        self.flex(.column).build(views: buttonRows)
    }

    func updateRadius() {
        buttonRows.forEach {
            $0.updateRadius()
        }
    }
}
