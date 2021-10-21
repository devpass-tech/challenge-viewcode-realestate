//
//  CarouselViewTest.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Elena Diniz on 21/10/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class CarouselViewTest: XCTestCase {
    
    func testCarousel() {
        
        let carouselView = CarouselView()
        
        assertSnapshot(matching: carouselView, as: .image, record: true)
        
        
    }
}
