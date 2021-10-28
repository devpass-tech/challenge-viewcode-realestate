//
//  ContactFormViewSnapshotTest.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Diego Llopis on 28/10/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class ContactFormViewSnapshotTest: XCTestCase {
    
    func testContactFormView() {
        let contactFormView = ContactFormView()
        
        assertSnapshot(matching: contactFormView, as: .image(size: .init(width: 300, height: 300)))
    }


}
