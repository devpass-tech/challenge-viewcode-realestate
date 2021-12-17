//
//  MapLocationViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 16/12/21.
//

import MapKit

class MapLocationViewController: UIViewController {

    private let mapLocation: MapLocationView = {
        let view = MapLocationView()
        return view
    }()

    override func loadView() {
        super.loadView()
        view = mapLocation
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Localização"
    }

    func configure(with property: Property) {
        let config = MapLocationViewModel(title: property.listingType,
                                          lat: property.address.geoLocation.location.lat,
                                          lng: property.address.geoLocation.location.lon)
        mapLocation.configure(with: config)
    }
}
