//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Duangcharoen on 21/1/2567 BE.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let calView = CalculatorView()
        calView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calView)


        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: calView.topAnchor),
            view.leadingAnchor.constraint(equalTo: calView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: calView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: calView.bottomAnchor),
        ])
    }
}
