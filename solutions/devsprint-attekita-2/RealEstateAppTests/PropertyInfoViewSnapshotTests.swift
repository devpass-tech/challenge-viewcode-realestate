//
//  PropertyInfoViewSnapshotTests.swift
//  RealEstateAppTests
//
//  Created by Alliston Aleixo on 15/03/22.
//


import XCTest
import SnapshotTesting
@testable import RealEstateApp

final class SettingsSnapshotTests: XCTestCase {
    let isRecording = false
    
    func testingPropertyInfoView() {
        let view = PropertyInfoView(
            viewModel: PropertyInfoViewModel(
                price: "R$ 405.000",
                condominiumFee: "495",
                area: 69,
                bedrooms: 3,
                bathrooms: 2,
                garage: 1),
            frame: CGRect(x: 0, y: 0, width: 500, height: 100)
        )
        
        SnapshotTesting.isRecording = isRecording
        assertSnapshot(matching: view, as: .image)
    }
    
    func testingPropertyInfoViewLargePrice() {
        let view = PropertyInfoView(
            viewModel: PropertyInfoViewModel(
                price: "R$ 1.305.405.000 / mês",
                condominiumFee: "495",
                area: 69,
                bedrooms: 3,
                bathrooms: 2,
                garage: 1),
            frame: CGRect(x: 0, y: 0, width: 500, height: 100)
        )
        
        SnapshotTesting.isRecording = isRecording
        assertSnapshot(matching: view, as: .image)
    }
    
    func testingPropertyInfoViewWithUrbanTax() {
        let view = PropertyInfoView(
            viewModel: PropertyInfoViewModel(
                price: "R$ 405.000",
                condominiumFee: "495",
                urbanTax: "200",
                area: 69,
                bedrooms: 3,
                bathrooms: 2,
                garage: 1),
            frame: CGRect(x: 0, y: 0, width: 500, height: 100)
        )
        
        SnapshotTesting.isRecording = isRecording
        assertSnapshot(matching: view, as: .image)
    }
    
    func testingPropertyInfoViewWithAddress() {
        let view = PropertyInfoView(
            viewModel: PropertyInfoViewModel(
                price: "R$ 405.000",
                condominiumFee: "495",
                urbanTax: "200",
                area: 69,
                bedrooms: 3,
                bathrooms: 2,
                garage: 1,
                address: "Jardim Íris, São Paulo"),
            frame: CGRect(x: 0, y: 0, width: 500, height: 150)
        )
        
        SnapshotTesting.isRecording = isRecording
        assertSnapshot(matching: view, as: .image)
    }
}
