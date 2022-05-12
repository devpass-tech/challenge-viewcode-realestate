//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.title = "Real Estate App 🏡"
        view = LoadingView()
        self.view.backgroundColor = .white

        let apiClient = RealEstateAPIClient()

        apiClient.fetchProperties { properties in

            print(properties)
        }
        
//        let loadingView = LoadingView()
//        
//        func toggleAnimation() {
//            if loadingView.activityIndicator.isAnimating {
//                loadingView.activityIndicator.startAnimating()
//            } else {
//                loadingView.activityIndicator.stopAnimating()
//            }
//        }
    }
}

