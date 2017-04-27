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
        //vc.configureTabBarItem(.chat)
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
        
        // チャットボタンの生成
        makeChatButton()
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
    
    func makeChatButton() {
        
        let image = UIImage(named: "button")!
        let selectedImage = UIImage.fontAwesomeIcon(name: .amazon, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        button.setBackgroundImage(image, for: .normal)
        button.setBackgroundImage(selectedImage, for: .selected)
        
        var center:CGPoint = self.tabBar.center;
        
        center.y = center.y - 50/2.0;
        
        button.center = center;
        
        button.addTarget(self, action: #selector(chatButtonAction(_:)), for: .touchUpInside)
        
        view.addSubview(button)
        
    }
    
    func chatButtonAction(_ sender: UIButton) {
        if let current = self.selectedViewController {
            let sb = UIStoryboard(name: "Chat", bundle: Bundle.main)
            let vc: UIViewController = sb.instantiateInitialViewController()! as! ChatViewController
            // 選択中VCに対してpresent
            current.present(vc, animated: true, completion: nil)
        }
    }
}

extension TabBarController: UITabBarControllerDelegate {
}
