//
//  SettingsSnapshostTests.swift
//  RealEstateAppTests
//
//  Created by Rodrigo Francischett Occhiuto on 14/03/22.
//
import XCTest
import SnapshotTesting
@testable import RealEstateApp

class SettingsSnapshotTests: XCTestCase {
    let isRecord = false
    
    func testingSettings() {
        let viewController = SettingsViewController()
        
        SnapshotTesting.isRecording = isRecord
        assertSnapshot(matching: viewController, as: .image(on: .iPhone8))
        
    }
}
