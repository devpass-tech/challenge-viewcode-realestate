//
//  PropertyInfoTests.swift
//  RealEstateAppTests
//
//  Created by Amaryllis Baldrez on 06/05/22.
//

import Foundation
import SnapshotTesting
import XCTest

@testable import RealEstateApp

class PropertyInfoTests: XCTestCase {
    
    var sut = PropertyInfoViewController()
    
    func testPropertyInfoViewController() {
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testPropertyInfoViewControllerInIphone11() {
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXsMax))
    }
}
