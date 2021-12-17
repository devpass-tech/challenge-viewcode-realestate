//
//  PropertyListViewController_Tests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Dairan on 14/12/21.
//

import SnapshotTesting
import XCTest
@testable import ViewCodeChallenge_RealEstate

class PropertyListViewController_Tests: XCTestCase {
    func test_PropertyListViewController() {
        let sut = PropertyListViewController()
        assertSnapshot(matching: sut, as: .image, record: false)
        assertSnapshot(matching: sut, as: .recursiveDescription, record: false)
    }
}
