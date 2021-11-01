//
//  DividerViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Bruna Fernanda Drago on 24/10/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class DividerViewSnapshotTests: XCTestCase {
    
    func testDividerView() {
        let dividerView = DividerView()
        
        assertSnapshot(matching: dividerView, as: Snapshotting.image(size: CGSize(width: 100, height: 1)),record: false)

    }
    
    func testCustomConvinienceDividerView() {
        let dividerView = DividerView(backgroundColor: .systemCyan, height: 3.0)
        
        assertSnapshot(matching: dividerView, as: Snapshotting.image(size: CGSize(width: 100, height: 3)),record: false)
    }
}
