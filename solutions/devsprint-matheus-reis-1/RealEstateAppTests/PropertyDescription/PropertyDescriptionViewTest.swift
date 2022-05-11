//
//  PropertyDescriptionViewTest.swift
//  RealEstateAppTests
//
//  Created by Cora on 11/05/22.
//

import Foundation
import XCTest
@testable import RealEstateApp
import SnapshotTesting

class PropertyDescriptionViewTest: XCTestCase {
    var sut = PropertyDescriptionViewComponent()
    
    override func setUpWithError() throws {
        
    }
    
    func testPropertyDescriptionComponent() {
        
        sut.updateDescription(description: "Apartamento INTEIRAMENTE REFORMADO e recentemente. Com acabamentos e materiais de primeira qualidade. Um estilo industrial e elegante com personalidade (assinado pelo arquiteto Cyro Guimarães). Objetos de design e muito verde! Sala grande, piso (taco) de madeira tratado, todos armários e estante novos, quartos e banheiros espaçosos. Vagas: possibilidade de alugar uma segunda (2a) vaga de garagem por R$ 200 reais mensais. Além da vaga que possui na escritura. Ensolarado, iluminado e ventilado. Estamos no 8o andar, com uma certa vista e sem barulhos. Paredes grossas, não da para escutar barulhos externos nem dos vizinhos. Prédio calmo e com uma vizinhança amigável e gentil. Além do condominio ser um valor baixo! (R$ 1.100). Bem localizado, no coração dos JARDINS, em frente a Velocity, do lado da melhor padaria do bairro (PAO), próximo as academias Bodytech / Firts e a alguns dos melhores restaurantes da cidade: EMA, Le jazz, Ristorantino, Tavares, MYK, SPOT, Ritz, entre outros.")
        
        assertSnapshot(matching: sut, as: .image(size: UIScreen.main.bounds.size))
    }
}
