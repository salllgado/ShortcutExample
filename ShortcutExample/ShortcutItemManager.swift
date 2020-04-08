//
//  ShortcutItemManager.swift
//  ShortcutExample
//
//  Created by Chrystian on 07/04/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

final class ShortcutItemManager {
    
    func register() {
        RegisteredItems.secondViewController.registerNewItem()
    }
    
    func flush() {
        UIApplication.shared.shortcutItems = []
    }
}
