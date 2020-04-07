//
//  RegisteredItems.swift
//  ShortcutExample
//
//  Created by Chrystian on 07/04/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

enum RegisteredItems: String {
    case secondViewController = "secondScreenDynamic"
    
    func registerNewItem() {
        switch self {
        case .secondViewController:
            let userInfo = ["identifier": "someID"]
            let shortcutItem = UIApplicationShortcutItem(type: self.rawValue, localizedTitle: "Red", localizedSubtitle: nil, icon: .init(type: .favorite), userInfo: userInfo as [String : NSSecureCoding])
            
            var shortcutItems = UIApplication.shared.shortcutItems?.filter({ (item) -> Bool in
                item.type != self.rawValue
            })
            shortcutItems?.append(shortcutItem)
            UIApplication.shared.shortcutItems = shortcutItems
        }
    }
}
