//
//  LoadingSnapshostTests.swift
//  RealEstateAppTests
//
//  Created by Camila Ribeiro Rodrigues on 16/03/22.
//

import XCTest
import SnapshotTesting
@testable import RealEstateApp

class LoadingSnapshotTests: XCTestCase {
	func testingLoading() {
		let view = LoadingView(frame: CGRect(x: 0, y: 0, width: 200, height: 800))
		assertSnapshot(matching: view, as: .image)
	}
}
