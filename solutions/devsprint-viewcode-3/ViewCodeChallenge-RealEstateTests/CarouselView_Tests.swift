    //
    //  ViewCodeChallenge_RealEstateTests.swift
    //  ViewCodeChallenge-RealEstateTests
    //
    //  Created by Dairan on 06/12/21.
    //

import SnapshotTesting
import XCTest
@testable import ViewCodeChallenge_RealEstate

class CarouselView_Tests: XCTestCase {
    let dataSource = [
        UIImage(named: "pic1"),
        UIImage(named: "pic2"),
        UIImage(named: "pic3"),
        UIImage(named: "pic4"),
        UIImage(named: "pic5"),
        UIImage(named: "pic6"),
    ]

    func test_CarouselViewTest() throws {
        let size = CGSize(width: 375, height: 667)
        let sut = CarouselView()
        sut.configure(with: dataSource, at: 1)

        assertSnapshot(matching: sut, as: .image(size: size), record: false)
        assertSnapshot(matching: sut, as: .recursiveDescription, record: false)
    }
}
