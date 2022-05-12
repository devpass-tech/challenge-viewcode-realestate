//
//  MapLocationView.swift
//  RealEstateApp
//
//  Created by Anderson Oliveira on 12/05/22.
//

import Foundation
import UIKit
import MapKit

final class MapLocationView: UIView, ViewCode {
    
    private lazy var mapLocation: MKMapView = {
        let map = MKMapView()
        map.isScrollEnabled = false
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    init(location: Location){
        super.init(frame: .zero)
        setupViews()
        setLocation(with: location)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLocation(with location: Location) {
        let pin = MKPointAnnotation()
        pin.coordinate = .init(latitude: location.lat, longitude: location.lon)
        mapLocation.addAnnotation(pin)
        mapLocation.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
    }
    
    func configureSubviews() {
        addSubview(mapLocation)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            mapLocation.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mapLocation.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapLocation.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mapLocation.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}
