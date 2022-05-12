//
//  PropertyDescriptionViewController.swift
//  RealEstateApp
//
//  Created by Anderson Oliveira on 05/05/22.
//

import Foundation
import UIKit

protocol PropertyDescriptionViewControllerProtocol {
    func callFullDescriptionView(descriptionLabel: String)
}

final class PropertyDescriptionViewController: UIViewController {
    
    private var descriptionString: String
    
    private var propertyView = PropertyDescriptionView()
    
    override func loadView() {
        self.view = propertyView
        propertyView.updateDescription(description: descriptionString)
    }
    
    init(descriptionLabel: String){
        descriptionString = descriptionLabel
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
