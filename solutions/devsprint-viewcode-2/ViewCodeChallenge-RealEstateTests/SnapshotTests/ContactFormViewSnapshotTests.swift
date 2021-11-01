//
//  ContactFormViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Bruna Fernanda Drago on 25/10/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class ContactFormViewSnapshotTests: XCTestCase {
    
    let snapshotSize = CGSize(width: 375, height: 200)
    
    func testContactFormView() {
        let contactForm = ContactFormView()
        
        assertSnapshot(matching: contactForm,
                       as: Snapshotting.image(size: self.snapshotSize), record: false)
    }
}
