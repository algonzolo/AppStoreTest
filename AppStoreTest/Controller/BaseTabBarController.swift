//
//  BaseTabBarController.swift
//  AppStoreTest
//
//  Created by Albert Garipov on 30.01.2023.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [createNVC(vc: UIViewController(), title: "Today", iconName: "doc.text.image"),
                           createNVC(vc: AppsFeedVC(), title: "Apps", iconName: "square.stack.3d.up.fill"),
                           createNVC(vc: AppSearchVC(), title: "Search", iconName: "magnifyingglass")]
    }

    fileprivate func createNVC(vc: UIViewController, title: String, iconName: String) -> UIViewController {
        let nvc = UINavigationController(rootViewController: vc)
        nvc.navigationBar.prefersLargeTitles = true
        nvc.tabBarItem.title = title
        nvc.tabBarItem.image = UIImage(systemName: iconName)
        vc.navigationItem.title = title
        vc.view.backgroundColor = .white
        return nvc
    }
}
