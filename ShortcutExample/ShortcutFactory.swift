//
//  ShortcutFactory.swift
//  ShortcutExample
//
//  Created by Chrystian on 07/04/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

final class ShortcutFactory {
    
    let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func getCoordinator(from item: UIApplicationShortcutItem) -> Coordinator {
        switch item.type {
        case RegisteredItems.secondViewController.rawValue :
            return ShortcutCoordinator(presenter: presenter)
        default:
            return MainCoordinator(presenter: presenter)
        }
    }
}

class ShortcutCoordinator: Coordinator {
    
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
        
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .red
        
        presenter.pushViewController(secondViewController, animated: true)
    }
}

extension ShortcutCoordinator: FirstViewControllerDelegate {
    
    func navigate() {
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .red
        
        presenter.pushViewController(secondViewController, animated: true)
    }
}
