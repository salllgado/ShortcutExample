//
//  MainCoordinator.swift
//  ShortcutExample
//
//  Created by Chrystian on 07/04/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit
import Foundation

class MainCoordinator: Coordinator {
    
    var presenter: UINavigationController
    var startViewController: UIViewController
    var startNavigationController: UINavigationController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController

        startViewController = viewController
        viewController.delegate = self
    }
    
    func start() {
        presenter.pushViewController(startViewController, animated: true)
    }
    
    func startFromShortcut() {
        start()
        navigate()
    }
}

extension MainCoordinator: FirstViewControllerDelegate {
    
    func navigateToHighlight() {
        let viewController = HighlightViewController()
        viewController.delegate = self
        
        presenter.pushViewController(viewController, animated: true)
    }
    
    func navigateToRoot() {
        presenter.popToRootViewController(animated: true)
    }
    
    func navigate() {
        let secondViewController = SecondViewController()
        secondViewController.delegate = self
        ShortcutItemManager().register()
        
        presenter.pushViewController(secondViewController, animated: true)
    }
}
