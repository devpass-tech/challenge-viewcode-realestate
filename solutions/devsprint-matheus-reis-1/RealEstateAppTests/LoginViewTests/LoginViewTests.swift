//
//  LoginViewTests.swift
//  RealEstateAppTests
//
//  Created by Cora on 11/05/22.
//

import Foundation
import XCTest
import SnapshotTesting

@testable import RealEstateApp

class LoginViewTests: XCTestCase {

    func test_ValidateLoginViewLayout() {

        let view = LoginView()
        assertSnapshot(matching: view, as: .image(size: CGSize(width: 414, height: 500)))
    }

}
