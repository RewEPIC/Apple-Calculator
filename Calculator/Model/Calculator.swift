//
//  Calculator.swift
//  Calculator
//
//  Created by Duangcharoen  on 16/1/2567 BE.
//

import UIKit

struct Calculator {
    
    let MAX_LABEL = 15
    
    private var operate: Operator? = nil
    private var isNegative = false
    private var display: String = ""
    
    private var tempTotal: Decimal? = nil
    private var total: Decimal = 0
    
    private var isDecimal: Bool {
        return display.contains(".")
    }
    
    var isReset = true
    var totalNumber: Decimal {
        return self.total
    }
    
    var displayText: String {
        guard !display.isEmpty else {
            return "0"
        }
        
        var parsedDouble = Decimal(string: display)
        guard parsedDouble != 0 && !isDecimal else {
            var displays = display.components(separatedBy: ".")
            displays[0] = Decimal(string: displays[0])!.decimalValue
            let newDisplay = displays.joined(separator: ".")
            return (isNegative ? "-\(newDisplay)" : newDisplay)
        }
        if isNegative {
            parsedDouble?.negate()
        }
        var formatted = parsedDouble?.decimalValue
        if display.last == "." {
            formatted! += "."
        }
        return formatted ?? "0"
    }
    
    mutating func calculate(number: Decimal) {
        switch self.operate {
        case .add:
            self.total += number
        case .substract:
            self.total -= number
        case .multiply:
            self.total *= number
        case .divide:
            self.total = divide(self.total,number)
        default:
            break
        }
    }
    
    mutating func onNumberTapped(_ number: Int) {
        let numberText = String(number)
        if !isReset && self.display != "0" {
            self.appendDisplay(String(number))
        } else {
            self.updateDisplay(numberText)
            self.isReset = false
        }
    }
    
    
    mutating func onOperatorTapped(_ operate: Operator) {
        let number = Decimal(string: display) ?? 0
        self.operate = operate
        self.total = number
        self.isReset = true
        self.tempTotal = nil
    }

    mutating func onAddOnTapped(_ addOn: AddOn) {
        let number = Decimal(string: self.display) ?? 0
        if addOn != .equal {
            self.tempTotal = nil
        }
        
        switch addOn {
        case .equal:
            guard !display.isEmpty else {
                return
            }
            if self.tempTotal != nil {
                self.calculate(number: self.tempTotal!)
            } else {
                self.tempTotal = self.total
                self.calculate(number: number)
            }
            
            self.updateDisplay(self.total)
            self.isReset = true
            
        case .negative:
            self.updateDisplay(number * -1)
        case .percentage:
            self.total = divide(Decimal(string: self.display)!,100)
            self.updateDisplay(self.total)
            self.isReset = true
        case .decimal:
            guard !isDecimal else {
                return
            }
            if display.isEmpty {
                self.updateDisplay("0")
            }
            
            self.isReset = false
            self.appendDisplay(".")
            
        }
        
    }
    mutating func onDeleteTapped() {
        self.updateDisplay("")
        self.total = 0
        self.isNegative = false
        self.isReset = true
    }
    mutating private func appendDisplay(_ appendString: String) {
        if self.display.count <= MAX_LABEL {
            self.display.append(appendString)
        }
    }
    
    mutating func updateDisplay() {
        self.updateDisplay(self.total)
    }
    
    mutating func updateDisplay(_ number: Decimal) {
        self.display = number.stringValue.count > MAX_LABEL ? number.scientificValue : number.stringValue
    }
    mutating func updateDisplay(_ display: String) {
        self.display = display
    }
    
    private func divide(_ divider: Decimal, _ number: Decimal) -> Decimal {
        guard number != 0 else {
            return 0
        }
        return divider / number
    }
}


enum Operator {
    case add
    case substract
    case multiply
    case divide
}

enum AddOn {
    case negative
    case percentage
    case equal
    case decimal
}
