//
//  MapLocationView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Alexandre Cardoso on 20/10/21.
//

import UIKit
import MapKit

class MapLocationView: UIView {
	
	// MARK: - UI Element
	let mapView: MKMapView
	
	
	// MARK: - Initialize
	override init(frame: CGRect) {
		mapView = MKMapView()
		super.init(frame: frame)
		configureView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	private func configureView() {
		configureSubviews()
		configureConstraints()
		configureRender()
	}
	
	func configure(with viewModel: MapLocationViewModel) {
		configureRegion(with: viewModel.coordinate)
		configureAnnotation(with: viewModel.coordinate)
	}
	
	private func configureRegion(with center: CLLocationCoordinate2D) {
		let region = MKCoordinateRegion(center: center,
												  latitudinalMeters: 500,
												  longitudinalMeters: 500)
		
		mapView.setRegion(region, animated: false)
	}
	
	private func configureAnnotation(with coordinate: CLLocationCoordinate2D) {
		let pinAnnotation = MKPointAnnotation()
		pinAnnotation.coordinate = coordinate
		mapView.addAnnotation(pinAnnotation)
	}
	
}

extension MapLocationView {
	
	func configureSubviews() {
		addSubview(mapView)
	}
	
	func configureConstraints() {
		mapView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			mapView.topAnchor.constraint(equalTo: topAnchor),
			mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
			mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
			mapView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	func configureRender() {
		mapView.mapType = .standard
		mapView.isUserInteractionEnabled = false
	}
	
}
