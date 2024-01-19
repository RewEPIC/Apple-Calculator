//
//  HorizontalColumn.swift
//  Calculator
//
//  Created by Duangcharoen  on 16/1/2567 BE.
//

import UIKit

class HorizontalColumn: UIStackView {

    func configure(stackView: UIStackView) {
        self.backgroundColor = .black
        self.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    

}
