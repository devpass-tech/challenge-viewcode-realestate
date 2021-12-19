//
//  PropertyFullDescriptionViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Murillo R. Araújo on 13/12/21.
//

import UIKit

class PropertyFullDescriptionViewController: UIViewController {
    
    private let propertyFullDescriptionView: PropertyFullDescriptionView = {
        let propertyFullDescriptionView = PropertyFullDescriptionView()
        return propertyFullDescriptionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = self.propertyFullDescriptionView
    }

    func configure(with config: PropertyFullDescriptionConfiguration) {
        let configuration = PropertyFullDescriptionConfiguration(title: config.title, description: config.description)
        propertyFullDescriptionView.configure(with: configuration)
    }
}
