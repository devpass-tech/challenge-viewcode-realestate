    //
    //  PropertyTableViewCell_Tests.swift
    //  ViewCodeChallenge-RealEstateTests
    //
    //  Created by Dairan on 10/12/21.
    //

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class PropertyTableViewCell_Tests: XCTestCase {

    func test_PropertyTableViewCell() throws {
        let frame = CGSize(width: 375, height: 275)


        let config = CarouselViewConfiguration(images: [UIImage(named: "pic1")!])
        let properConfig = PropertyInfoConfiguration(price: "400,00", iptu: "1200", condoFee: "120,33", usableAreas: 43, parkingSpaces: 3, bathrooms: 3, bedrooms: 3, address: "Rua das Flores, 234, Jardins")
        let cellConfig = PropertyTableViewCellConfiguration(carousel: config, propertyInfoConfig: properConfig)

        let sut = PropertyTableViewCell(frame: .zero)
        sut.configure(with: cellConfig)
        assertSnapshot(matching: sut, as: .image(size: frame), record: false)
        assertSnapshot(matching: sut, as: .recursiveDescription, record: false)
    }

}
