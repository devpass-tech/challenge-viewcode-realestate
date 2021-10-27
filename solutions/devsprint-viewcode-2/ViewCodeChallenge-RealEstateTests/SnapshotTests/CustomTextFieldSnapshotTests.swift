//
//  CustomTextFieldSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Bruna Fernanda Drago on 27/10/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class CustomTextFieldSnapshotTests: XCTestCase {
    
    let snapshotSize = CGSize(width: 375, height: 48)
    
    func testCustomTextField() {
        let customTextField = CustomTextField()
        customTextField.placeholder = "Snapshot"
        assertSnapshot(matching: customTextField,
                       as: Snapshotting.image(size: self.snapshotSize), record: true)
    }
}
