//
//  ResultView.swift
//  Calculator
//
//  Created by Duangcharoen  on 19/1/2567 BE.
//

import UIKit

class ResultView: UIView {
    
    var view: UIView!
    
    public func setup(superview: UIView) {
        self.view = superview
        
        setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = .white
        
//        let safeArea = self.safeAreaLayoutGuide
    }
}
