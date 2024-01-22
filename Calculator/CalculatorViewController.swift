//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Duangcharoen on 21/1/2567 BE.
//

import UIKit

class CalculatorViewController: UIViewController {

    lazy var calculatorView: CalculatorView = {
        let view = CalculatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(calculatorView)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: calculatorView.topAnchor),
            view.leadingAnchor.constraint(equalTo: calculatorView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: calculatorView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: calculatorView.bottomAnchor),
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculatorView.updateRadius()

    }
}
