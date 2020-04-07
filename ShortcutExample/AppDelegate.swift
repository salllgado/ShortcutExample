//
//  AppDelegate.swift
//  ShortcutExample
//
//  Created by Chrystian on 07/04/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var applicationCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window: window)
        
        self.window = window
        applicationCoordinator = appCoordinator
        applicationCoordinator?.start()
        
        return true
    }

}

