//
//  PropertyDescriptionTest.swift
//  RealEstateAppTests
//
//  Created by Anderson Oliveira on 05/05/22.
//

import Foundation
import XCTest
import SnapshotTesting

@testable import RealEstateApp

class PropertyDescriptionTest: XCTestCase {
    
    var sut = PropertyDescriptionView()
    
    override func setUpWithError() throws { }
    
    func testPropertyDescriptionView() {
        sut.updateDescription(description: "Mussum Ipsum, cacilds vidis litro abertis. Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.Não sou faixa preta cumpadi, sou preto inteiris, inteiris.Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi.\nA ordem dos tratores não altera o pão duris.Aenean aliquam molestie leo, vitae iaculis nisl.Mais vale um bebadis conhecidiss, que um alcoolatra anonimis.Viva Forevis aptent taciti sociosqu ad litora torquent.")
        assertSnapshot(matching: sut, as: .image(size: UIScreen.main.bounds.size))
    }
}
