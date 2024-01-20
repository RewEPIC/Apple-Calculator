//
//  ViewControllerDelegate.swift
//  Calculator
//
//  Created by Duangcharoen  on 16/1/2567 BE.
//

import UIKit

extension ViewController: CalculatorButtonDelegate {
    
    
    func numberDidChanged(deleteButton: UIButton,button: UIButton) {
        updateDeleteBtn(deleteButton: deleteButton)
    }
    
    func deleteButtonDidTapped(button: UIButton) {
        updateDeleteBtn(deleteButton: button)
        calculator.onDeleteTapped()
        updateNumberLabel()
        //test
    }
    
    
    func addOnButtonDidTapped(addOn: AddOn, button: UIButton) {
        calculator.onAddOnTapped(addOn)
        updateNumberLabel()
    }
    
    func numberButtonDidTapped(number: Int, button: UIButton) {
        calculator.onNumberTapped(number)
        updateNumberLabel()
    }
    
    func operatorButtonDidTapped(operate: Operator, button: UIButton) {
        calculator.onOperatorTapped(operate)
        updateNumberLabel()
    }
    
    private func updateDeleteBtn(deleteButton: UIButton) {
        deleteButton.titleLabel?.text = calculator.isReset ? "AC" : "C"
    }
    
    private func updateNumberLabel() {
        numberLabel.text = calculator.displayText
    }

    
    
    
}
