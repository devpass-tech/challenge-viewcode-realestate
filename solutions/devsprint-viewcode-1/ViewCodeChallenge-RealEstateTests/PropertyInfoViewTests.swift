//
//  PropertyInfoViewTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Pedro Boga on 21/10/21.
//

import Foundation
import XCTest
import SnapshotTesting

@testable import ViewCodeChallenge_RealEstate

class PropertyInfoViewTestes: XCTestCase {
    let view = PropertyInfoView(frame: .init(x: 0, y: 0, width: 500, height: 200))
    let viewModel = PropertyInfoViewModel(
        price: "450.000", monthlyCondoFee: "495", yearlyIptu: nil, usableAreas: 69, bedroom: 3, bathrooms: 2, parkingSpaces: 1, address: nil
    )
    
    func testCustomView() {
        view.configLabelsText(viewModel: viewModel)
        
        assertSnapshot(matching: view, as: .image, record: false)
        
    }
}
