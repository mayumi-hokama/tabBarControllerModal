//
//  TabBarController.swift
//  tabTest
//
//  Created by m_okama on 2017/04/21.
//  Copyright © 2017年 hokama. All rights reserved.
//

import UIKit

enum TabBarItem: Int {
    case simulation = 1
    case chat
    case info
}

class TabBarController: UITabBarController {
    
    private lazy var navigationController1: UINavigationController = {
        var sb = UIStoryboard(name: "Simulation", bundle: Bundle.main)
        let vc: UIViewController = sb.instantiateInitialViewController()! as! SimulationViewController
        vc.configureTabBarItem(.simulation)
        return UINavigationController(rootViewController: vc)
    }()
    

    private lazy var navigationController2: UINavigationController = {
        let vc = ChatBaseViewController()
        vc.configureTabBarItem(.chat)
        return UINavigationController(rootViewController: vc)
    }()


    private lazy var navigationController3: UINavigationController = {
        var sb = UIStoryboard(name: "Info", bundle: Bundle.main)
        let vc: UIViewController = sb.instantiateInitialViewController()! as! InfoViewController
        vc.configureTabBarItem(.info)
        return UINavigationController(rootViewController: vc)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // sb読み込み
        self.setViewControllers((NSArray(objects: navigationController1, navigationController2, navigationController3) as! [UIViewController]), animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if let naviVC = viewController as? UINavigationController {
            if naviVC.topViewController is ChatBaseViewController {
                // 現在選択中のVCを取得
                if let current = self.selectedViewController {
                    let sb = UIStoryboard(name: "Chat", bundle: Bundle.main)
                    let vc: UIViewController = sb.instantiateInitialViewController()! as! ChatViewController
                    // 選択中VCに対してpresent
                    current.present(vc, animated: true, completion: nil)
                }
                return false
            }
        }
        return true
    }
}
