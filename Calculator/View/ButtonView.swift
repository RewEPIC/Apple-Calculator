//
//  ButtonView.swift
//  Calculator
//
//  Created by Duangcharoen  on 19/1/2567 BE.
//

import UIKit

class ButtonView: UIView {
    public func setup() -> UIView {
        setupUI()
        return self
    }
    
    func setupUI() {
        self.backgroundColor = .black
        
        let buttonRow1 = ButtonRowView().setup(backgroundColor: .black)
        let buttonRow2 = ButtonRowView().setup(backgroundColor: .gray)
        let buttonRow3 = ButtonRowView().setup(backgroundColor: .black)
        let buttonRow4 = ButtonRowView().setup(backgroundColor: .gray)
        let buttonRow5 = ButtonRowView().setup(backgroundColor: .black)
        self.flex(.column).build(views: [
            buttonRow1,
            buttonRow2,
            buttonRow3,
            buttonRow4,
            buttonRow5
        ])
    }
}
