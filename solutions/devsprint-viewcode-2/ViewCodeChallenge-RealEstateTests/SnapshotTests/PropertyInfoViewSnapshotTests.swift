//
//  PropertyInfoViewSnapshotTests.swift
//  ViewCodeChallenge-RealEstateTests
//
//  Created by Alexandre Cardoso on 20/10/21.
//

import XCTest
import SnapshotTesting

@testable import ViewCodeChallenge_RealEstate

class PropertyInfoViewSnapshotTests: XCTestCase {
	
	var sut: PropertyInfoView!
	var viewModel: PropertyInfoViewModel!
	
	override func setUp() {
		let frame = CGRect(x: 0, y: 0, width: 375, height: 150)
		sut = PropertyInfoView(frame: frame)
		viewModel = propertyInfoFactory()
	}
	
	override func tearDown() {
		sut = nil
	}
	
	func testPropertyInfoView(){
		sut.configure(with: viewModel)
		
		assertSnapshot(matching: sut, as: .image, record: false)
	 }
}


// MARK: - Extension

extension PropertyInfoViewSnapshotTests {
	
	func propertyInfoFactory() -> PropertyInfoViewModel {
		let propertyViewModel = PropertyInfoViewModel(
			salePrice: "450.000",
			condominiumPrice: "495",
			IptuPrice: "0",
			footage: "69",
			bedroom: "3",
			bathroom: "2",
			parkingSpaces: "1",
			address: "Sem endereço")
		
		return propertyViewModel
	}
	
}
