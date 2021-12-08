//
//  LoadingViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Rodrigo Francischett Occhiuto on 08/12/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class LoadingViewSnapshootTests: XCTestCase {
    func testingLoadingView() {
        let loadingView = LoadingView()
        let loadingViewModel = LoadingViewConfiguration(labelText: "Loading...")
        loadingView.configure(with: loadingViewModel)
        
        assertSnapshot(matching: loadingView,
                       as: Snapshotting.image(size: CGSize(width: 200, height: 200)))
    }
}
