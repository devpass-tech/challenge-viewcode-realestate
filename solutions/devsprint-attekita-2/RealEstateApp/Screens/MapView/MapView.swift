//
//  MapViewController.swift
//  RealEstateApp
//
//  Created by Ronaldo Ribeiro on 21/03/22.
//

import UIKit
import MapKit


class MapView: UIView, MKMapViewDelegate {
    
    // MARK: - Private Properties
    private let map = MKMapView()
    var coordinate: CLLocationCoordinate2D?

    // MARK: - Init
    override init(frame: CGRect) {
        super .init(frame: frame)
        setup()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupMapView()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.addSubview(map)
    }
    
    private func setupMapView() {
        
        map.delegate = self
        map.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addCustonPin() {
        guard let coordinate = coordinate else {
            return
        }
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "You Are Here!"
        map.addAnnotation(pin)
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: topAnchor),
            map.leadingAnchor.constraint(equalTo: leadingAnchor),
            map.trailingAnchor.constraint(equalTo: trailingAnchor),
            map.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setCoordinate(latitude: Double, longitude: Double) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.coordinate = coordinate
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: false)
        addCustonPin()
    }
    
    // MARK: - Methods MKMapViewDelegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            //Create the view
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        }
        else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "placeholder")
        
        return annotationView
    }
}
