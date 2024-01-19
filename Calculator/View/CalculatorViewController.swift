//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Duangcharoen  on 19/1/2567 BE.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    lazy var calculatorView = CalculatorView()
    
    override func loadView() {
        self.view = calculatorView
    }
    
    override func viewDidLoad() {
    }
    
}
