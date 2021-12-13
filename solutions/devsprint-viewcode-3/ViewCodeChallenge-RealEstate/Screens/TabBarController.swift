//
//  TabBarController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Flavia Arsuffi  on 08/12/21.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Tabbar Appearance
        if #available(iOS 15, *) {
           let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = .systemGray6
           tabBar.standardAppearance = tabBarAppearance
           tabBar.scrollEdgeAppearance = tabBarAppearance
        } else {
            tabBar.barTintColor = .systemGray6
        }
        
        // Items ViewControllers
        let item1 = UINavigationController(rootViewController:  PropertyListViewController())
        let item2 = UINavigationController(rootViewController:  FavoritesViewController())
        let item3 = UINavigationController(rootViewController:  AccountViewController())
        
        // Items Style
        let icon1 = UITabBarItem(title: "Real Estate APP",
                                 image: Asset.home.image,
                                 selectedImage: Asset.home.image)
        item1.tabBarItem = icon1
        
        let icon2 = UITabBarItem(title: "Favorites",
                                 image: Asset.heart.image,
                                 selectedImage: Asset.heart.image)
        item2.tabBarItem = icon2
        
        let icon3 = UITabBarItem(title: "Account",
                                 image: Asset.user.image,
                                 selectedImage: Asset.user.image)
        item3.tabBarItem = icon3
        
        // Set ViewControllers
        self.setViewControllers([item1,item2,item3], animated: false)
    }
}
