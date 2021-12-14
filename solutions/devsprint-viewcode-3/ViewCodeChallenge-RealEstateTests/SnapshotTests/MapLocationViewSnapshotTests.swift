//
//  MapLocationViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Guilherme Strutzki on 14/12/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class MapLocationViewSnapshotTest: XCTestCase {
    
    func testMapLocationView() {
        let mapLocationView = MapLocationView()
        mapLocationView.configure(with: MapLocationViewModel(title: "Lorem ipsum",
                                                             lat: -31.765696,
                                                             lng: -52.315801))
        assertSnapshot(matching: mapLocationView,
                       as: Snapshotting.image(size: CGSize(width: 400, height: 250)))
    }
}
