//
//  MapViewLocationTest.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Felipe Forcinetti on 22/10/21.
//

import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate
import XCTest

class MapLocationViewTests: XCTestCase {
    
    func test_MapLocationView() {
        
        let sut: MapLocationView = MapLocationView()
        sut.configMapLocation(geoLocation: GeoLocation.init(precision: "ROOFTOP", location: Location(lon: -24.1134674, lat: -49.3410117)))
        let size = CGSize(width: UIScreen.main.bounds.width, height: 300)
        assertSnapshot(matching: sut, as: .image(size: size), record: false)
    }
    
}
