//
//  UITabBarController.swift
//  RealEstateApp
//
//  Created by Anderson Oliveira on 13/05/22.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    let imageStrings: [String] = ["house",  "heart", "person"]
    let tabTitles: [String] = ["Real Estate App", "Favorites", "Account"]
    
    init(){
        super.init(nibName: nil, bundle: nil)
        setTabBarController()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTabBarController(){
        setViewControllers([PropertyListViewController(), FavoritesViewController(), AccountViewController()], animated: true)
        modalPresentationStyle = .fullScreen
        tabBar.tintColor = .link
        
        guard let items = tabBar.items else {
            return
        }
        
        for x in 0..<items.count {
            items[x].image = UIImage(named: imageStrings[x])
            items[x].title = tabTitles[x]
        }
    }
}
