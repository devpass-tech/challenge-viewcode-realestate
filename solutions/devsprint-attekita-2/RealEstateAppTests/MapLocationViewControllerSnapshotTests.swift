//
//  MapLocationViewControllerSnapshotTests.swift
//  RealEstateAppTests
//
//  Created by Alliston Aleixo on 22/03/22.
//

import XCTest
import SnapshotTesting
@testable import RealEstateApp

final class MapLocationViewControllerSnapshotTests: XCTestCase {
    let isRecording = false
    
    func testingMapLocationViewControllerEmpty() {
        let viewController = MapLocationViewController()
        viewController.location = Location(lon: -49.328795, lat: -16.706822)
        viewController.modalPresentationStyle = .automatic
        viewController.modalTransitionStyle = .crossDissolve
        
        SnapshotTesting.isRecording = isRecording
        assertSnapshot(matching: viewController, as: .image)
    }
}
