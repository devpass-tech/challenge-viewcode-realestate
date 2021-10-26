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
    let frame = CGRect(x: 0, y: 0, width: 434, height: 10)
    let sut = DividerView(frame: frame)

    assertSnapshot(matching: sut, as: .image, record: false)
    assertSnapshot(matching: sut, as: .recursiveDescription, record: false)
  }
}
