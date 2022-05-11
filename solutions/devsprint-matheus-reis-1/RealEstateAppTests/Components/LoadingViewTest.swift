//
//  LoadingViewTest.swift
//  RealEstateAppTests
//
//  Created by Cora on 11/05/22.
//

import Foundation
import XCTest
import SnapshotTesting
@testable import RealEstateApp

class LoadingViewTest: XCTestCase {
    
    var sut =  LoadingView()
    
    override func setUpWithError() throws {
       
    }

    func testDividerView() {
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 414, height: 250 )))
    }
}
