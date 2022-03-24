//
//  PropertyMoreDescriptionSnapshotTests.swift
//  RealEstateAppTests
//
//  Created by Camila Ribeiro Rodrigues on 24/03/22.
//

import XCTest
import SnapshotTesting
@testable import RealEstateApp

class PropertyMoreDescriptionSnapshotTests: XCTestCase {
	private enum Strings {
		static let titleTextPropertyDescription = "Descrição"
		static let textPropertyDescription = "Apartamento INTEIRAMENTE REFORMADO e recentemente. Com acabamentos e materiais de primeira qualidade. Um estilo industrial e elegante com personalidade (assinado pelo arquiteto Cyro Guimarães). Objetos de design e muito verde! Sala grande, piso (taco)  de madeira tratado, todos armários e estante novos, quartos e banheiros espaçosos. Vagas: Possibilidade de alugar uma segunda (2a) vaga de garagem por R$ 200 reais mensais. Além da vaga que possui na escritura. Ensolarado, iluminado e ventilado. Estamos no 8o andar, com uma certa vista e sem barulhos. Paredes grossas, não da para escutar barulhos externos nem dos vizinhos. Prédio Calmo e com uma vizinhança amigável e gentil. Além do condomínio ser um valor baixo! (R$ 1.100). Bem localizado, no coração do JARIDNS, em frente a Valocity, do lado da melhor padaria do bairro (PAO), próximo as academias BodyTech/ Firts e a alguns dos melhores restaurantes da cidade: EMA, Le jazz, Ristorantino, Tavares, MYK,SPOT, Ritz, entre outros. Apartamento INTEIRAMENTE REFORMADO e recentemente. Com acabamentos e materiais de primeira qualidade. Um estilo industrial e elegante com personalidade (assinado pelo arquiteto Cyro Guimarães). Objetos de design e muito verde! Sala grande, piso (taco)  de madeira tratado, todos armários e estante novos, quartos e banheiros espaçosos. Vagas: Possibilidade de alugar uma segunda (2a) vaga de garagem por R$ 200 reais mensais. Além da vaga que possui na escritura. Ensolarado, iluminado e ventilado. Estamos no 8o andar, com uma certa vista e sem barulhos. Paredes grossas, não da para escutar barulhos externos nem dos vizinhos. Prédio Calmo e com uma vizinhança amigável e gentil. Além do condomínio ser um valor baixo! (R$ 1.100). Bem localizado, no coração do JARIDNS, em frente a Valocity, do lado da melhor padaria do bairro (PAO), próximo as academias BodyTech/ Firts e a alguns dos melhores restaurantes da cidade: EMA, Le jazz, Ristorantino, Tavares, MYK,SPOT, Ritz, entre outros."
	}
	let isRecording = false
	
	func testingPropertyMoreDescription() {
		let viewController = PropertyDescriptionViewController(textDescription: Strings.textPropertyDescription, titleDescription: Strings.titleTextPropertyDescription)
		
		SnapshotTesting.isRecording = isRecording
		assertSnapshot(matching: viewController, as: .image)
	}
}
