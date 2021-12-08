//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyListViewController: UIViewController {

    private lazy var propertyDescriptionView: PropertyDescriptionView = {
        PropertyDescriptionView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        let apiClient = RealEstateAPIClient()

        apiClient.fetchProperties { properties in

            print(properties)
        }
    }
    
    override func loadView() {
        super.loadView()
        view = propertyDescriptionView
    }
}

