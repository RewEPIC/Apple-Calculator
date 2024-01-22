//
//  NSLayoutConstraints+Extension.swift
//  Calculator
//
//  Created by Duangcharoen on 21/1/2567 BE.
//

import UIKit

extension NSLayoutConstraint {
    
    var stringValue: String {
        let debugs = self.description.components(separatedBy: " ")
        return "\(debugs[1]) \(debugs[2]) \(debugs[3])"
    }
}
