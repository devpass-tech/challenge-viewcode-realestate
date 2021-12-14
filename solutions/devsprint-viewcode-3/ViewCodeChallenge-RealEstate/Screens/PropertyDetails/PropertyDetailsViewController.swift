//
//  PropertyDetailsViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyDetailsViewController: UIViewController {
    // MARK: Properties
    private lazy var customView: PropertyDetailsView = {
        let view = PropertyDetailsView()
        return view
    }()
    
    // MARK: Initializers
//property: Property
    init() {
        super.init(nibName: nil, bundle: nil)
//        let configuration = PropertyDetailsViewConfiguration(
//            carouselViewConfiguration: .init(images: <#T##[UIImage]#>, page: <#T##Int#>),
//            propertyInfoViewConfiguration: <#T##PropertyInfoConfiguration#>)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Apartamento para comprar"
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct PropertyDetailsViewControllerPreview: PreviewProvider {
    static var previews: some View {
            let usersViewController = PropertyDetailsViewController()
            return UINavigationController(rootViewController: usersViewController)
                .preview
        }
}
#endif
