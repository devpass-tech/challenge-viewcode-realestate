//
//  DividerViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Guilherme Strutzki on 07/12/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class DividerViewSnapshotTests: XCTestCase {
    
    func testDividerView() {
        let dividerView = DividerView()
        assertSnapshot(matching: dividerView,
                       as: Snapshotting.image(size: CGSize(width: 200, height: 1)))
    }
}
