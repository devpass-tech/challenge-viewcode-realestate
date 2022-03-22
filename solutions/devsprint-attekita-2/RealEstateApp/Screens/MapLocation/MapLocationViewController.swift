//
//  MapLocationViewController.swift
//  RealEstateApp
//
//  Created by Alliston Aleixo on 22/03/22.
//

import UIKit
import MapKit

final class MapLocationViewController: UIViewController {
    // MARK: - Components
    private var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    public var location: Location? = nil {
        didSet {
            guard let location = location else { return }
            
            updateRegion(location)
        }
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        self.view = mapView
        
        if let navigationController = self.navigationController {
            navigationItem.title = "Localização"
            navigationController.navigationBar.backgroundColor = .white
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        }
    }
    
    private func updateRegion(_ location: Location) {
        let clLocation: CLLocation = CLLocation(latitude: location.lat, longitude: location.lon)
        let regionRadius: CLLocationDistance = 1000
        
        let coordinateRegion = MKCoordinateRegion(
            center: clLocation.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = clLocation.coordinate
        
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(annotation)
    }
}
