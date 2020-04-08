//
//  Coordinator.swift
//  ShortcutExample
//
//  Created by Chrystian on 07/04/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

// MARK: - Coordinator  -

public protocol Coordinator {
    var presenter: UINavigationController { get set }
    var startViewController: UIViewController { get }
    
    func start()
    func startFromShortcut()
}

extension Coordinator {
    
    func startFromShortcut() {
        start()
    }
}
