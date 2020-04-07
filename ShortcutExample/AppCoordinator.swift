//
//  AppCoordinator.swift
//  ShortcutExample
//
//  Created by Chrystian on 07/04/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

/*
- Documentation - https://www.raywenderlich.com/158-coordinator-tutorial-for-ios-getting-started
*/

import UIKit
import Foundation

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    var mainCoordinator: MainCoordinator?
    var startViewController: UIViewController
    var presenter: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        presenter = UINavigationController()
        startViewController = UIViewController()
    }
    
    func start() {
        mainCoordinator = MainCoordinator(presenter: presenter)
        
        window.rootViewController = presenter
        mainCoordinator?.start()
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator {
    
    func start(with shortcutItem: UIApplicationShortcutItem) {
        let coordinator = ShortcutFactory(presenter: presenter).getCoordinator(from: shortcutItem)
        coordinator.start()
    }
}
