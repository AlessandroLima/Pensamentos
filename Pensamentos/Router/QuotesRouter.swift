//
//  PensamentosRouter.swift
//  Pensamentos
//
//  Created by Alessandro on 22/08/19.
//  Copyright © 2019 Alessandro. All rights reserved.
//
import Foundation
import UIKit

protocol QuotesRouterRouterProtocol {
    func inicialView()
}


class QuotesRouter: UINavigationController, QuotesRouterRouterProtocol {
    
    // MARK: Properties
    
    var window: UIWindow?
    let myTabBarController = UITabBarController()
    
    // MARK: Initializers
    
    convenience init(window: UIWindow?) {
        self.init()
        self.window = window
    }
    
    func inicialView() {
        let quotesVC = QuotesViewController()
        quotesVC.title = "Pensamentos"
        quotesVC.tabBarItem = UITabBarItem(title: "Pensamentos", image: UIImage.init(named: "quotes"), tag: 0)
        
        let settingsVC = SettingsViewController()
        settingsVC.title = "Ajustes"
        settingsVC.tabBarItem = UITabBarItem(title: "Ajustes", image: UIImage.init(named: "settings"), tag: 1)
        
        let controllers = [quotesVC, settingsVC]
        
        myTabBarController.viewControllers = controllers
        myTabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        
        window?.rootViewController = myTabBarController
        
    }
    
    
}
