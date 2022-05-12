//
//  EmptyViewTest.swift
//  RealEstateAppTests
//
//  Created by Cora on 12/05/22.
//

import Foundation
import XCTest
@testable import RealEstateApp
import SnapshotTesting

class EmptyViewTest: XCTestCase {
    var sut = EmptyView()
    
    func testEmptyView() {
        assertSnapshot(matching: sut, as: .image(size: UIScreen.main.bounds.size))
    }
    
    func testEmptyViewUpdateViewFunc() {
        sut.updateView(with: .init(titleLabel: "Sorry, Nothing to show!", textLabel: "Try to search again with another city or neighborhood"))
        assertSnapshot(matching: sut, as: .image(size: UIScreen.main.bounds.size))
    }
}
