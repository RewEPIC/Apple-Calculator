//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Duangcharoen  on 16/1/2567 BE.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    override func tearDown() {
        super.tearDown()
        calculator = nil
    }

    func testPlus_withNumberIs20AndOperateIsAdd_shouldReturn20() {
        let number = Decimal(20)
        let operate: Operator = .add
        
        calculator.onOperatorTapped(operate)
        calculator.calculate(number: number)
        let result = calculator.totalNumber
        
        XCTAssertEqual(result, 20, "0+20 should return 20")
    }

    func testSubstract_withNumberIs10AndOperateIsSubstract_shouldReturnMinus10() {
        let number = Decimal(10)
        let operate: Operator = .substract
        
        calculator.onOperatorTapped(operate)
        calculator.calculate(number: number)
        let result = calculator.totalNumber
        
        XCTAssertEqual(result, -10, "0-10 should return 10")
    }
    
    func testMultiply_withNumberIs5AndOperateIsMultiply_shouldReturn0() {
        let number = Decimal(5)
        let operate: Operator = .multiply
        
        calculator.onOperatorTapped(operate)
        calculator.calculate(number: number)
        let result = calculator.totalNumber
        
        XCTAssertEqual(result, 0, "0x5 should return 0")
    }
    
    func testDivide_withNumberIs2AndOperateIsDivide_shouldReturn0() {
        let number = Decimal(2)
        let operate: Operator = .divide
        
        calculator.onOperatorTapped(operate)
        calculator.calculate(number: number)
        let result = calculator.totalNumber
        
        XCTAssertEqual(result, 0, "0/2 should return 0")
    }
    
    func testPlusDivide_withNumber1Is4AndNumber2Is5AndOperate1IsAddAndOperate2IsDivide_shouldReturn0_8() {
        let number1 = Decimal(4)
        let number2 = Decimal(5)
        let operate1: Operator = .add
        let operate2: Operator = .divide
        
        calculator.onOperatorTapped(operate1)
        calculator.calculate(number: number1)
        calculator.updateDisplay()
        calculator.onOperatorTapped(operate2)
        calculator.calculate(number: number2)
        calculator.updateDisplay()
        let result = calculator.totalNumber
        
        XCTAssertEqual(result, 0.8, "(0+4)/5 should return 0.8")
    }
}
