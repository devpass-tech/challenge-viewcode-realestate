//
//  LoginViewSnapshotTest.swift
//  RealEstateAppTests
//
//  Created by Fabio Martinez on 17/02/22.
//

import XCTest
import SnapshotTesting
@testable import RealEstateApp

class LoginViewSnapshotTest: XCTestCase {

    func testLoginView() throws {
        let loginView = LoginView()
        assertSnapshot(matching: loginView, as: Snapshotting.image(size: CGSize(width: 300, height: 350)), record: false)
    }
}
