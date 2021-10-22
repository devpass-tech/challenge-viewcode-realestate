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
        
        assertSnapshot(matching: carouselView, as: Snapshotting.image(size: CGSize(width: 414, height: 200)), record: true)
        
        
    }
}
