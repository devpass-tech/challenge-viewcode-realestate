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
	let isRecording = false
	
	func testingLoading() {
		let viewController = DebugViewController()
		SnapshotTesting.isRecording = isRecording
		assertSnapshot(matching: viewController, as: .image(on: .iPhone8))
	}
}
