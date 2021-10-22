//
//  MapLocationView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Felipe Forcinetti on 20/10/21.
//

import UIKit
import MapKit
import CoreLocation

class MapLocationView: UIView {
    
    lazy var mapLocation: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.mapType = MKMapType.standard
        map.isUserInteractionEnabled = false
        return map
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubView()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSubView() {
        self.addSubview(self.mapLocation)

    }
    
    public func configMapLocation(geoLocation: GeoLocation) {
        
        let location = CLLocationCoordinate2DMake(geoLocation.location.lat, geoLocation.location.lon )
        let region = MKCoordinateRegion(center: location, span: .init())
        self.mapLocation.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = location
        self.mapLocation.addAnnotation(pin)
        
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            //MapLocationView
            mapLocation.topAnchor.constraint(equalTo: self.topAnchor),
            mapLocation.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapLocation.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapLocation.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}


