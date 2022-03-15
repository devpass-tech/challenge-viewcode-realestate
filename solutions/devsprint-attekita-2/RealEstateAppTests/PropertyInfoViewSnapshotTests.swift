//
//  PropertyInfoViewSnapshotTests.swift
//  RealEstateAppTests
//
//  Created by Alliston Aleixo on 15/03/22.
//


import XCTest
import SnapshotTesting
@testable import RealEstateApp

class SettingsSnapshotTests: XCTestCase {
    let isRecording = false
    
    func testingPropertyInfoView() {
        let view = PropertyInfoView(
            price: "R$ 405.000",
            condominiumFee: 495,
            area: 69,
            bedrooms: 3,
            bathrooms: 2,
            garage: 1,
            frame: CGRect(x: 0, y: 0, width: 500, height: 100)
        )
        
        SnapshotTesting.isRecording = isRecording
        assertSnapshot(matching: view, as: .image)
        
    }
}
