//
//  UIViewController+Extension.swift
//  tabTest
//
//  Created by m_okama on 2017/04/25.
//  Copyright © 2017年 hokama. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func configureTabBarItem(_ type: TabBarItem) {
        
        switch type {
        case .simulation:
            self.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        case .chat:
            self.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        case .info:
            self.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 3)
        }
    }
}
