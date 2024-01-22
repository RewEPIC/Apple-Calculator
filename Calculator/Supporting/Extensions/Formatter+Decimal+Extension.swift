//
//  DecimalExtension.swift
//  Calculator
//
//  Created by Duangcharoen  on 18/1/2567 BE.
//

import UIKit

extension Formatter {
    
    static let decimalFormatters: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    static let stringFormatters: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ""
        formatter.maximumFractionDigits = 10
        return formatter
    }()
    
    static let scientificFormatters: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 5
        return formatter
    }()
    
}

extension Decimal {
    
    var stringValue: String {
        return Formatter.stringFormatters.string(for: self) ?? "0"
    }
    var scientificValue: String {
        return Formatter.scientificFormatters.string(for: self) ?? "0"
    }
    var decimalValue: String {
        return Formatter.decimalFormatters.string(for: self) ?? "0"
    }
}
