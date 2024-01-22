//
//  FlexLyout.swift
//  Calculator
//
//  Created by Duangcharoen on 21/1/2567 BE.
//

import UIKit
import Foundation

class FlexLayout {
    
    var parent: UIView
    var direction: FlexDirection
    var margin: CGFloat
    var debug: Bool
    
    init(_ parent: UIView, _ direction: FlexDirection) {
        self.parent = parent
        self.direction = direction
        self.margin = 0
        self.debug = false
    }
    func detect() -> FlexLayout {
        self.debug = true
        return self
    }
    
    func margin(_ margin: CGFloat) -> FlexLayout {
        self.margin = margin
        return self
    }
    
    func build(views: [UIView]) {
        var constraints: [NSLayoutConstraint] = []
        
        for (index,current) in views.enumerated() {
            self.parent.addSubview(current)
            current.translatesAutoresizingMaskIntoConstraints = false
            constraints.append( contentsOf: self.flex(index: index, views: views) )
        }
        NSLayoutConstraint.activate(constraints)
        
        if debug {
            debug(constraints)
        }
    }
    
    private func debug(_ constraints: [NSLayoutConstraint]) {
        print(constraints)
        constraints.forEach{ constraint in
            print(constraint.stringValue)
            print("--------------------")

        }
        
    }
    
}

private extension FlexLayout {
    
    
    func centerSafeArea(_ view: UIView) -> [NSLayoutConstraint] {
        
        let safeArea = self.parent.safeAreaLayoutGuide
        return [
            view.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            view.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        ]
    }
    
    func flex(index: Int, views: [UIView]) -> [NSLayoutConstraint] {
        let safeArea = self.parent.safeAreaLayoutGuide
        let currentView = views[index]
        //LEADING, TRAILING = SAFE AREA
        let previousView = index > 0 ? views[index-1] : nil
        let nextView = index < views.count-1 ? views[index+1] : nil
        
        switch self.direction {
        case .row:
            var constraints: [NSLayoutConstraint] = [
                currentView.topAnchor.constraint(equalTo: self.parent.topAnchor, constant: margin),
                currentView.bottomAnchor.constraint(equalTo: self.parent.bottomAnchor, constant: -margin)
            ]
            //FIRST VIEW
            if index == 0 {
                constraints.append( currentView.leadingAnchor.constraint(equalTo: self.parent.leadingAnchor, constant: margin))
            }
            // ANY HAS NEXT VIEW
            if let nextView {
                constraints.append(contentsOf: [
                    currentView.trailingAnchor.constraint(equalTo: nextView.leadingAnchor, constant: -margin ),
                    currentView.widthAnchor.constraint(equalTo: nextView.widthAnchor)
                ])
            //LAST VIEW
            } else {
                let widthAnchor = previousView != nil ? previousView!.widthAnchor : self.parent.widthAnchor
                constraints.append(contentsOf: [
                    currentView.trailingAnchor.constraint(equalTo: self.parent.trailingAnchor, constant: -margin),
                    currentView.widthAnchor.constraint(equalTo: widthAnchor )
                ])
            }
            return constraints
        
        case .column:
            var constraints: [NSLayoutConstraint] = [
                currentView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin),
                currentView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin),
            ]
            if index == 0 {
                constraints.append( currentView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: margin))
            }
            if let nextView {
                constraints.append(contentsOf: [
                    currentView.bottomAnchor.constraint(equalTo: nextView.topAnchor, constant: -margin),
                    currentView.heightAnchor.constraint(equalTo: nextView.heightAnchor)
                ])
            } else {
                let heightAnchor = previousView != nil ? previousView!.heightAnchor : safeArea.heightAnchor
                constraints.append(contentsOf: [
                    currentView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,constant: -margin ),
                    currentView.heightAnchor.constraint(equalTo: heightAnchor)
                ])
            }
            return constraints
        }
    }
}


enum FlexDirection {
    
    case row
    case column
    
}

