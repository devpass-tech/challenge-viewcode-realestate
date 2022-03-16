//
//  EmptyViewSnapshotTests.swift.swift
//  RealEstateAppTests
//
//  Created by Alliston Aleixo on 16/03/22.
//

import XCTest
import SnapshotTesting
@testable import RealEstateApp

class EmptyViewSnapshotTests: XCTestCase {
    let isRecording = false
    
    func testingEmptyView() {
        let view = EmptyView(frame: CGRect(x: 0, y: 0, width: 500, height: 150))
        view.updateView(with: EmptyViewConfiguration(
            title: "No listings found!",
            subtitle: "Search for cities and neighborhoods using the search bar above"))
        
        SnapshotTesting.isRecording = isRecording
        assertSnapshot(matching: view, as: .image)
    }
    
    func testingEmptyViewHugeTitle() {
        let view = EmptyView(frame: CGRect(x: 0, y: 0, width: 500, height: 150))
        view.updateView(with: EmptyViewConfiguration(
            title: "No listings found! But this title is extremely huge and can break the layout",
            subtitle: "Search for cities and neighborhoods using the search bar above"))
        
        SnapshotTesting.isRecording = isRecording
        assertSnapshot(matching: view, as: .image)
    }
}
