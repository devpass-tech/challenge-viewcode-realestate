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
    
    var viewController = PropertyInfoViewController()
    var view = PropertyInfoView()
    
    func testPropertyInfoViewController() {
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func testPropertyInfoView() {
        assertSnapshot(matching: view, as: .image)
    }
    
    func testPropertyInfoViewControllerInIphone11() {
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneXsMax))
    }
}
