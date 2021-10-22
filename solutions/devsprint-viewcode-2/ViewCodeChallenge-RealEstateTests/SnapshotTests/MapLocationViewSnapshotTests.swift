//
//  MapLocationViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Alexandre Cardoso on 20/10/21.
//

import XCTest
import CoreLocation
import SnapshotTesting

@testable import ViewCodeChallenge_RealEstate

class MapLocationViewSnapshotTests: XCTestCase {
	
	var sut: MapLocationView!
	var viewModel: MapLocationViewModel!
	
	override func setUp() {
		super.setUp()
		
		let frame = CGRect(x: 0, y: 0, width: 375, height: 150)
		sut = MapLocationView(frame: frame)
	}
	
	override func tearDown() {
		super.tearDown()
		sut = nil
		viewModel = nil
	}

	func testMapLocationView() {
		let initialLocation = CLLocationCoordinate2D(latitude: -23.554389, longitude: -46.608185)
		let viewModel = MapLocationViewModel(coordinate: initialLocation)
		
		sut.configure(with: viewModel)
		
		assertSnapshot(matching: sut, as: .image, record: false)		
	}

}
