//
//  ContactFormViewSnapshotTest.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Guilherme Strutzki on 08/12/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class ContactFormViewSnapshotTest: XCTestCase {
    
    func testContactFormView() {
        let contactFormView = ContactFormView()
        assertSnapshot(matching: contactFormView,
                       as: Snapshotting.image(size: CGSize(width: 400, height: 250)))
    }
}
