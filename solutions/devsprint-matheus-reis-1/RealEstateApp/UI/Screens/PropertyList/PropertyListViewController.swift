//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyListViewController: UIViewController {
    
    lazy var propertyInfo: PropertyInfoView = {
        let propertyInfo = PropertyInfoView()
        return propertyInfo
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Real Estate App 🏡"

        self.view.backgroundColor = .white

        let apiClient = RealEstateAPIClient()

        apiClient.fetchProperties { properties in

            print(properties)
        }
        
        propertyInfo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(propertyInfo)
        NSLayoutConstraint.activate([
            
        ])
    }
}

