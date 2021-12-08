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
//        propertyDescriptionView.configure(with: PropertyDescriptionViewConfiguration(description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."))
    }
}

