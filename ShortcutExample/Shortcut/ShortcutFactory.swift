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
            return MainCoordinator(presenter: presenter)
        default:
            return MainCoordinator(presenter: presenter)
        }
    }
}
