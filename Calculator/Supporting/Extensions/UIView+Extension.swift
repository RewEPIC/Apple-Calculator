//
//  UIView+Extension.swift
//  Calculator
//
//  Created by Duangcharoen on 21/1/2567 BE.
//

import UIKit

extension UIView {

    func flex(_ direction: FlexDirection) -> FlexLayout {
        return FlexLayout(self, direction)
    }
    
    var stringValue: String {
        return String(describing: type(of: self))
    }
}
