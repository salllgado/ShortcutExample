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
}

extension MainCoordinator: FirstViewControllerDelegate {
    
    func navigate() {
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .red
        
        presenter.pushViewController(secondViewController, animated: true)
    }
}
