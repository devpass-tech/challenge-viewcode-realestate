//
//  ButtonViewSnapshotTest.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Diego Llopis on 21/10/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class ButtonViewSnapshotTest: XCTestCase {
    
    func testButtonView(){
        
        let button = ButtonView()
        button.setButtonTitle("Click")
        
        assertSnapshot(matching: button, as: .image(size: .init(width: 200, height: 80)))
    }
}
