//
//  PropertyListViewControllerTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Dairan on 27/10/21.
//

import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate
import XCTest

class PropertyListViewControllerTests: XCTestCase {
  func test_PropertyListViewController() {
    let sut = PropertyListViewController()
    sut.view.layoutIfNeeded()

    assertSnapshot(matching: sut, as: .wait(for: 6, on: .image(on: .iPhoneX)), record: false)
    assertSnapshot(matching: sut, as: .wait(for: 0, on: .recursiveDescription), record: false)
  }
}
