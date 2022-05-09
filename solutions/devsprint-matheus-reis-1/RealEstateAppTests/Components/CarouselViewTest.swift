//
//  CarouselView.swift
//  RealEstateAppTests
//
//  Created by Cora on 09/05/22.
//

import Foundation
import XCTest
@testable import RealEstateApp
import SnapshotTesting

class CarouselViewTest: XCTestCase {
    
    var sut = CarouselView(images: ["pic1","pic3","pic9"])
    
    override func setUpWithError() throws {
        
    }
    
    func testFullCarouselView() {
        sut.translatesAutoresizingMaskIntoConstraints = false
        sut.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * CGFloat(sut.images.count)).isActive = true
        sut.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        print(sut.widthAnchor)
        
        assertSnapshot(matching: sut, as: .image(size: UIScreen.main.bounds.size))
    }
    
    func testFirstImageCarouselView() {
        assertSnapshot(matching: sut, as: .image(size: UIScreen.main.bounds.size))
    }
}
