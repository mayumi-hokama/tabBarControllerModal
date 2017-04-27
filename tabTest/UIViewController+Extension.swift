//
//  UIViewController+Extension.swift
//  tabTest
//
//  Created by m_okama on 2017/04/25.
//  Copyright © 2017年 hokama. All rights reserved.
//

import UIKit
import FontAwesome_swift

extension UIViewController {
    
    func configureTabBarItem(_ type: TabBarItem) {
        
        var image: UIImage!
        var selectedImage: UIImage!
        var tag: Int!
        let imageInsets: UIEdgeInsets! = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        
        switch type {
        case .simulation:
            image = UIImage.fontAwesomeIcon(name: .github, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
            selectedImage = UIImage.fontAwesomeIcon(name: .github, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
            tag = TabBarItem.simulation.rawValue
        case .chat:
            break
        case .info:
            image = UIImage.fontAwesomeIcon(name: .android, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
            selectedImage = UIImage.fontAwesomeIcon(name: .android, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
            tag = TabBarItem.info.rawValue
        }
        
        // 画像の設定
        self.tabBarItem = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        // 画像の表示位置を調整
        self.tabBarItem.imageInsets = imageInsets
        self.tabBarItem.tag = tag
        
        // 文字列は透過して非表示にする
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.clear], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.clear], for: UIControlState())
    }
}
