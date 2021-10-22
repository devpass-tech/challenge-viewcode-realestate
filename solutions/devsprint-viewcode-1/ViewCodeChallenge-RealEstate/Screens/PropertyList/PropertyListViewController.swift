//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyListViewController: UIViewController {

    var mapLocationView: MapLocationView?
    
    override func loadView() {
        self.mapLocationView = MapLocationView()
        self.view = mapLocationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.backgroundColor = .white

        let apiClient = RealEstateAPIClient()

        apiClient.fetchProperties { properties in
            self.mapLocationView?.configMapLocation(geoLocation: properties[0].address.geoLocation)
            print(properties)
        }
    }
}

