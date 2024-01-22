//
//  ViewController.swift
//  Calculator
//
//  Created by Duangcharoen  on 16/1/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    var calculator: Calculator!
//    var calculator: CalculatoCrModel!
    var delegate: CalculatorButtonDelegate?
    
    @IBOutlet weak var substract: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var add: UIButton!
    
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var negative: UIButton!
    @IBOutlet weak var percentage: UIButton!
    @IBOutlet weak var decimal: UIButton!
    
    @IBOutlet weak var delete: UIButton!
    
    @IBAction func deleteDidTapped(_ sender: UIButton) {
        delegate?.deleteButtonDidTapped(button: sender)
    }
    
    @IBAction func operatorDidTapped(_ sender: UIButton) {
        var operate: Operator!
        switch sender {
        case divide:
            operate = .divide
        case multiply:
            operate = .multiply
        case substract:
            operate = .substract
        case add:
            operate = .add
        default:
            break
        }
        delegate?.operatorButtonDidTapped(operate: operate, button: sender)
        
        delegate?.numberDidChanged(deleteButton: delete, button: sender)
    }
    
    @IBAction func addOnDidTapped(_ sender: UIButton) {
        var addOn: AddOn!
        switch sender {
        case percentage:
            addOn = .percentage
        case negative:
            addOn = .negative
        case equal:
            addOn = .equal
        case decimal:
            addOn = .decimal
        default:
            break
        }
        delegate?.addOnButtonDidTapped(addOn: addOn, button: sender)
        
        delegate?.numberDidChanged(deleteButton: delete, button: sender)
    }
    
    @IBAction func numberDidTapped(_ sender: UIButton) {
        let number: Int = Int( (sender.titleLabel?.text)!) ?? 0
        delegate?.numberButtonDidTapped(number: number, button: sender)
        
        delegate?.numberDidChanged(deleteButton: delete, button: sender)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupData()
        setupLayout()
    }
    
    func setupData() {
        self.delegate = self
        self.calculator = Calculator()
        self.numberLabel.text = calculator.displayText
    }
    
    func setupLayout() {
        let calculatorView = CalculatorView()
        self.view.addSubview(calculatorView)
    }
}

protocol CalculatorButtonDelegate {
    func numberButtonDidTapped(number: Int, button: UIButton)
    
    func operatorButtonDidTapped(operate: Operator, button: UIButton)
    
    func addOnButtonDidTapped(addOn: AddOn, button: UIButton )
    func deleteButtonDidTapped(button: UIButton)
    
    func numberDidChanged(deleteButton: UIButton, button: UIButton)
    
}

