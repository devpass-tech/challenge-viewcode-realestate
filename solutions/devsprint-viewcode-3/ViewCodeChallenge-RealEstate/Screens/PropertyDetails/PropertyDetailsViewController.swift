//
//  PropertyDetailsViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyDetailsViewController: UIViewController {

    private var property: Property

    // MARK: Properties
    private lazy var customView: PropertyDetailsView = {
        let view = PropertyDetailsView()
        view.delegate = self
        return view
    }()
    
    // MARK: Initializers
    init(property: Property) {
        self.property = property
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
        let images = property.images.compactMap { UIImage(named: $0) }
        let carouselConfiguration: CarouselViewConfiguration = .init(images: images)
        
        let propertyInfoConfiguration: PropertyInfoConfiguration = .init(price: property.pricingInfos.price,
                                                                         iptu: property.pricingInfos.yearlyIptu,
                                                                         condoFee: property.pricingInfos.monthlyCondoFee,
                                                                         usableAreas: property.usableAreas,
                                                                         parkingSpaces: property.parkingSpaces,
                                                                         bathrooms: property.bathrooms,
                                                                         bedrooms: property.bedrooms,
                                                                         address: property.address.neighborhood)
        
        let mapConfiguration: MapLocationViewModel = .init(title: property.address.neighborhood, lat: property.address.geoLocation.location.lat, lng: property.address.geoLocation.location.lon)
        
        let descriptionConfiguration: PropertyDescriptionViewConfiguration = .init(description: property.description)
        
        let configuration: PropertyDetailsViewConfiguration = .init(carouselViewConfiguration: carouselConfiguration,
                                                                    propertyInfoViewConfiguration: propertyInfoConfiguration,
                                                                    mapViewConfiguration: mapConfiguration,
                                                                    descriptionViewConfiguration: descriptionConfiguration)
        return configuration
    }
}

extension PropertyDetailsViewController {

    func showMap() {
        let viewController = MapLocationViewController()
        viewController.configure(with: property)
        present(viewController, animated: true, completion: nil)
    }
}

extension PropertyDetailsViewController: PropertyDetailsViewDelegate {
    func didTapMapView() {
        let viewController = MapLocationViewController()
        viewController.configure(with: property)
        show(viewController, sender: self)
    }
}

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//
//struct PropertyDetailsViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        let viewController = PropertyDetailsViewController(property: makePropertyMock())
//            return UINavigationController(rootViewController: viewController).preview
//        }
//}
//#endif
