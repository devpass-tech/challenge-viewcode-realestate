//
//  ButtonViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Pedro Gabriel on 08/12/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class ButtonViewSnapshotTests: XCTestCase {
    func test_buttonDefaultState() {

        let configuration = ButtonViewConfiguration(title: "Ver mais",
                                                    pressedButton: nil)
        let buttonView = ButtonView()
        buttonView.configure(with: configuration)

        let result = verifySnapshot(matching: buttonView,
                                    as: Snapshotting.image(size: CGSize(width: 360, height: 50)))
        XCTAssertNil(result)
    }
}
