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

    func test_CarouselViewTest() throws {
        let images = [
            UIImage(named: "pic1")!,
            UIImage(named: "pic2")!,
            UIImage(named: "pic3")!,
            UIImage(named: "pic4")!,
            UIImage(named: "pic5")!,
            UIImage(named: "pic6")!,
        ]
        
        let size = CGSize(width: 375, height: 667)

        let sut = CarouselView()

        let viewConfiguration = CarouselViewConfiguration(images: images, page: 1)
        sut.configure(with: viewConfiguration)

        assertSnapshot(matching: sut, as: .image(size: size), record: false)
        assertSnapshot(matching: sut, as: .recursiveDescription, record: false)
    }
}
