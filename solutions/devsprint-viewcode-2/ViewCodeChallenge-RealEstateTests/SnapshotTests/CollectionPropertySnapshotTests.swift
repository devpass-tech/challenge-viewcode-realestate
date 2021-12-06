//
//  CollectionPropertySnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Alan Silva on 27/10/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class CollectionPropertySnapshotTests: XCTestCase {
    
    func testCollectionProperty(){
        let carouselView = PropertyCollectionView()
        
        assertSnapshot(matching: carouselView, as: Snapshotting.image(size: CGSize(width: 414, height: 200)), record: true)
    }
}
