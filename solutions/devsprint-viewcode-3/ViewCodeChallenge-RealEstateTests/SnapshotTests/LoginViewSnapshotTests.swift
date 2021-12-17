//
//  LoginViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Fabio Martinez on 17/12/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class LoginViewSnapshotTests: XCTestCase {

    
    func testLoginView() throws {
        let loginView = LoginView()
        assertSnapshot(matching: loginView,
                       as: Snapshotting.image(size: CGSize(width: 400, height: 450)), record: false)
    }

    

}
