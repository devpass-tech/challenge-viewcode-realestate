//
//  DividerViewTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Dairan on 20/10/21.
//

import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate
import XCTest

class DividerViewTests: XCTestCase {

  func test_dividerWith1pxAndBackgroundColorLightGray() {

    let sut = DividerView()

    assertSnapshot(matching: sut, as: .image(size: .init(width: 434, height: 200)), record: false)
    assertSnapshot(matching: sut, as: .recursiveDescription)
  }
}
