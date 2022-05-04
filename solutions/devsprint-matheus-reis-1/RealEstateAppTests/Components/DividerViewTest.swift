//
//  File.swift
//  RealEstateAppTests
//
//  Created by Cora on 04/05/22.
//

import Foundation
import XCTest
//import SnapshotTesting

@testable import RealEstateApp
import SnapshotTesting


class DividerViewTest: XCTestCase {
    
    var sut =  DividerView()
    
    override func setUpWithError() throws {
       
    }

    func testDividerView() {
        assertSnapshot(matching: sut, as: .image)
    }
}
