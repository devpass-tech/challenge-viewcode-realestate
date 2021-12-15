//
//  PropertyDetailsViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Pedro Gabriel on 14/12/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCodeChallenge_RealEstate

class PropertyDetailsViewSnapshotTests: XCTestCase {
    
    var sut: PropertyDetailsView!
    var configuration: PropertyDetailsViewConfiguration!
    
    override func setUp() {
        let frame = CGRect(x: 0, y: 0, width: 480, height: 1000)
        sut = PropertyDetailsView()
        sut.frame = frame
        configuration = makePropertyDetailsViewConfiguration()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_propertyDetailsViewDefaultState() {
        sut.configure(with: configuration)
        assertSnapshot(matching: self.sut, as: .image, record: false)
    }
}

extension PropertyDetailsViewSnapshotTests {
    func makePropertyDetailsViewConfiguration() -> PropertyDetailsViewConfiguration {
        let carouselConfiguration: CarouselViewConfiguration = .init(images: [.init(named: "pic1")!,
                                                                              .init(named: "pic2")!,
                                                                              .init(named: "pic3")!])
        
        let propertyInfoConfiguration: PropertyInfoConfiguration = .init(price: "401.000",
                                                                         iptu: "670",
                                                                         condoFee: "560",
                                                                         usableAreas: 60,
                                                                         parkingSpaces: 2,
                                                                         bathrooms: 2,
                                                                         bedrooms: 2,
                                                                         address: "Av. Taylor Swift")
        
        let mapConfiguration: MapLocationViewModel = .init(title: "Lorem ipsum", lat: -31.765696, lng: -52.315801)
        
        let descriptionConfiguration: PropertyDescriptionViewConfiguration = .init(description: "Lorem Ipsum")
        
        let configuration: PropertyDetailsViewConfiguration = .init(carouselViewConfiguration: carouselConfiguration,
                                                                    propertyInfoViewConfiguration: propertyInfoConfiguration,
                                                                    mapViewConfiguration: mapConfiguration,
                                                                    descriptionViewConfiguration: descriptionConfiguration)
        return configuration
    }
}
