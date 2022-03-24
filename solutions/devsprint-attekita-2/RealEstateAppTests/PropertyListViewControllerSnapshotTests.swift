//
//  PropertyListViewControllerSnapshotTests.swift
//  RealEstateAppTests
//
//  Created by Alliston Aleixo on 18/03/22.
//

import XCTest
import SnapshotTesting
@testable import RealEstateApp

final class PropertyListViewControllerSnapshotTests: XCTestCase {
    let isRecording = false
    
    func testingPropertyListViewControllerEmpty() {
        let viewController = PropertyListViewController()
        
        SnapshotTesting.isRecording = isRecording
        assertSnapshot(matching: viewController, as: .image)
    }
}
