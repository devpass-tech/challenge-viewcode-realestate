//
//  ButtonViewTest.swift
//  RealEstateAppTests
//
//  Created by Cora on 12/05/22.
//

import Foundation
import XCTest
import SnapshotTesting
@testable import RealEstateApp

class ButtonViewTest: XCTestCase {
    
    var sut =  ButtonView()

    func testButtonView() {
        sut.setTitle("Ver mais", for: .normal)
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 414, height: 100 )))
    }
}
