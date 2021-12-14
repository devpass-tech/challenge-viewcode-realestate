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
    init(property: Property) {
        super.init(nibName: nil, bundle: nil)
        let configuration = getPropertyDetailsViewConfiguration(of: property)
        customView.configure(with: configuration)
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
    
    private func getPropertyDetailsViewConfiguration(of property: Property) -> PropertyDetailsViewConfiguration {
        let carouselConfiguration: CarouselViewConfiguration = .init(images: [.init(named: "pic1")!,
                                                                              .init(named: "pic2")!,
                                                                              .init(named: "pic3")!],
                                                                     page: 0)
        
        let propertyInfoConfiguration: PropertyInfoConfiguration = .init(price: "401.000",
                                                                         iptu: "670",
                                                                         condoFee: "560",
                                                                         usableAreas: 60,
                                                                         parkingSpaces: 2,
                                                                         bathrooms: 2,
                                                                         bedrooms: 2,
                                                                         address: "Av. Taylor Swift")
        
        let mapConfiguration: MapLocationViewModel = .init(title: "Lorem ipsum", lat: -31.765696, lng: -52.315801)
        
        let descriptionConfiguration: PropertyDescriptionViewConfiguration = .init(description: "Lorem Ipsum")
        
        let configuration: PropertyDetailsViewConfiguration = .init(carouselViewConfiguration: carouselConfiguration,
                                                                    propertyInfoViewConfiguration: propertyInfoConfiguration,
                                                                    mapViewConfiguration: mapConfiguration,
                                                                    descriptionViewConfiguration: descriptionConfiguration)
        return configuration
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct PropertyDetailsViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = PropertyDetailsViewController(property: makePropertyMock())
            return UINavigationController(rootViewController: viewController).preview
        }
}
#endif
