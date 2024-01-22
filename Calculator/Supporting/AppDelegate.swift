//
//  AppDelegate.swift
//  Calculator
//
//  Created by Duangcharoen  on 16/1/2567 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appLanding: AppLanding = .calculator
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window = appLanding.scene(window!)
        
        return true
    }
    
    
}

enum AppLanding {
    case testCalculator
    case calculator
    
    func scene(_ window: UIWindow) -> UIWindow {
        switch self {
        case .testCalculator:
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let todoApp = storyboard.instantiateViewController(withIdentifier: "ViewController")
            let navigationController = UINavigationController(rootViewController: todoApp)
            navigationController.setNavigationBarHidden(true, animated: false)
            window.rootViewController = navigationController
 
        case .calculator:
            window.rootViewController = CalculatorViewController()
            
        }
        window.makeKeyAndVisible()
        return window
    }
    
}


