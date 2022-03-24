//
//  TabbarViewController.swift
//  RealEstateApp
//
//  Created by Bruno Silva on 21/03/22.
//

import UIKit

final class TabbarViewController: UITabBarController {
    
    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        setupViewControllers()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Priate Methods
    private func setupViewControllers() {
        viewControllers = [createPropertyListViewController(),
                           createFavoritesViewController(),
                           createAccountViewController()]
    }
    
    private func createPropertyListViewController() -> UINavigationController {
        let propertyList = PropertyListViewController()
        propertyList.title = "Real Estate App"
        propertyList.tabBarItem.image = UIImage(named: "home")
        
        return UINavigationController(rootViewController: propertyList)
    }
    
    private func createFavoritesViewController() -> UINavigationController {
        let favorite = FavoritesViewController()
        favorite.title = "Favorite"
        favorite.tabBarItem.image = UIImage(named: "heart")
        
        return UINavigationController(rootViewController: favorite)
    }
    
    private func createAccountViewController() -> UINavigationController {
        let account = AccountViewController()
        account.title = "Account"
        account.tabBarItem.image = UIImage(named: "user")
        
        return UINavigationController(rootViewController: account)
    }
}
