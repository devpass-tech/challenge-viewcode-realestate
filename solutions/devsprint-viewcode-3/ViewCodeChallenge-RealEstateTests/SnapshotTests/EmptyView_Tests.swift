//
//  EmptyView_Tests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Dairan on 15/12/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class EmptyView_Tests: XCTestCase {

    func test_emptyViewPropertyViewController () throws {

        let sut = PropertyListViewController()
        let config = EmptyViewConfiguration(titleInformation: "No listings found", msgInformation: "Search for cities and neighborhoods using the search bar above")
        let emptyView = EmptyView()
        emptyView.configure(with: config)

        sut.view = emptyView

        assertSnapshot(matching: sut, as: .image, record: true)
        assertSnapshot(matching: sut, as: .recursiveDescription, record: true)
    }
}
