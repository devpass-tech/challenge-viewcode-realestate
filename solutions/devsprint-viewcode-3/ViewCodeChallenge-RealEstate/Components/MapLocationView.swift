//
//  MapLocationView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Guilherme Strutzki on 13/12/21.
//

import UIKit
import MapKit

struct MapLocationViewModel {
    let title: String
    var lat: Double
    var lng: Double
}

class MapLocationView: UIView {
    private let locationMapView: MKMapView = {
        let map = MKMapView(frame: .zero)
        map.mapType = MKMapType.standard
        map.translatesAutoresizingMaskIntoConstraints = false
        map.isUserInteractionEnabled = false
        return map
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func centerMapRegion(_ coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion.init(center: coordinate,
                                             latitudinalMeters: 200,
                                             longitudinalMeters: 200)
        locationMapView.setRegion(region, animated: true)
    }
    
    private func addAnnotation(coordinate: CLLocationCoordinate2D, title: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        locationMapView.addAnnotation(annotation)
    }
    
    public func configure(with configuration: MapLocationViewModel) {
        let coordinate = CLLocationCoordinate2D(latitude: configuration.lat,
                                                 longitude: configuration.lng)
        centerMapRegion(coordinate)
        addAnnotation(coordinate: coordinate, title: configuration.title)
    }
}

extension MapLocationView: ViewCode {
    func configureSubviews() {
        addSubview(locationMapView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            locationMapView.topAnchor.constraint(equalTo: topAnchor),
            locationMapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationMapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            locationMapView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureAdditionalBehaviors() {}
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MapLocationViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let mapLocationView = MapLocationView()
            mapLocationView.configure(with: MapLocationViewModel(title: "Lorem ipsum",
                                                                 lat: -31.765696,
                                                                 lng: -52.315801
                                                                ))
            return mapLocationView
        }
        .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                              height: 250))
    }
}
#endif
