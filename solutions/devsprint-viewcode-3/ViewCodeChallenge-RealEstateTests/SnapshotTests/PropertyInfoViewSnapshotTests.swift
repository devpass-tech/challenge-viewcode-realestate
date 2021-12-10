//
//  PropertyInfoViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Murillo R. Araújo on 08/12/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class PropertyInfoViewSnapshotTests: XCTestCase {

   let snapshotSize = CGSize(width: 400, height: 200)

    func testPropertyInfoView() {
        let configuration = PropertyInfoConfiguration(price: "400.000", iptu: "670", condoFee: "560", usableAreas: 60, parkingSpaces: 2, bathrooms: 2, bedrooms: 2, address: "Av. Taylor Swift")
        let propertyInfo = PropertyInfoView()
        propertyInfo.configure(with: configuration)
        
        assertSnapshot(matching: propertyInfo, as: .image(size: snapshotSize))
    }
}
