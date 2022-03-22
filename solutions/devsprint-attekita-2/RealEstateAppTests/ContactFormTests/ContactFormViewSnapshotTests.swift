//
//  ContactFormViewSnapshotTests.swift
//  RealEstateAppTests
//
//  Created by Bruno Silva on 17/03/22.
//

import XCTest
import SnapshotTesting
@testable import RealEstateApp

class ContactFormViewSnapshotTests: XCTestCase {
    
    // MARK: - Private Properties
    private let recorded: Bool = false
    private let sizeView: CGRect = CGRect(x: 0, y: 0, width: 500, height: 250)
    
    // MARK: - Public Methods
   func testContactFormView() {
        let contactForm: ContactFormView = ContactFormView(frame: sizeView)
        SnapshotTesting.isRecording = recorded
       
        assertSnapshot(matching: contactForm, as: .image)
    }
    
    func testCreateContact() {
        let contactForm: ContactFormView = ContactFormView(frame: sizeView)
        contactForm.createContactWith(name: "Bruno Silva",
                                      and: "teste@teste.com.br")
        SnapshotTesting.isRecording = recorded
        
        assertSnapshot(matching: contactForm, as: .image)
    }
    
    func testBigInformation() {
        let contactForm: ContactFormView = ContactFormView(frame: sizeView)
        contactForm.createContactWith(name: "Barnaby Marmaduke Aloysius Benjy Cobweb Dartagnan Egbert Felix Gaspar",
                                      and: "teste@teste.com.br")
        SnapshotTesting.isRecording = recorded
        
        assertSnapshot(matching: contactForm, as: .image)
    }
}
