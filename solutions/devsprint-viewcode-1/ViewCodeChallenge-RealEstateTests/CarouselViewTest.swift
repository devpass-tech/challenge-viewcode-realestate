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
        
        var json = "{\"description\":\"Apartamento INTEIRAMENTE REFORMADO e recentemente. Com acabamentos e materiais de primeira qualidade. Um estilo industrial e elegante com personalidade (assinado pelo arquiteto Cyro Guimarães). Objetos de design e muito verde! Sala grande, piso (taco) de madeira tratado, todos armários e estante novos, quartos e banheiros espaçosos. Vagas: possibilidade de alugar uma segunda (2a) vaga de garagem por R$ 200 reais mensais. Além da vaga que possui na escritura. Ensolarado, iluminado e ventilado. Estamos no 8o andar, com uma certa vista e sem barulhos. Paredes grossas, não da para escutar barulhos externos nem dos vizinhos. Prédio calmo e com uma vizinhança amigável e gentil. Além do condominio ser um valor baixo! (R$ 1.100). Bem localizado, no coração dos JARDINS, em frente a Velocity, do lado da melhor padaria do bairro (PAO), próximo as academias Bodytech / Firts e a alguns dos melhores restaurantes da cidade: EMA, Le jazz, Ristorantino, Tavares, MYK, SPOT, Ritz, entre outros.\",\"usableAreas\":70,\"listingType\":\"USED\",\"createdAt\":\"2017-04-22T18:39:31.138Z\",\"listingStatus\":\"ACTIVE\",\"id\":\"7baf2775d4a2\",\"parkingSpaces\":1,\"updatedAt\":\"2017-04-22T18:39:31.138Z\",\"owner\":false,\"images\":[\"pic10\",\"pic5\",\"pic14\",\"pic1\",\"pic4\"],\"address\":{\"city\":\"\",\"neighborhood\":\"\",\"geoLocation\":{\"precision\":\"NO_GEOCODE\",\"location\":{\"lon\":0,\"lat\":0}}},\"bathrooms\":1,\"bedrooms\":2,\"pricingInfos\":{\"yearlyIptu\":\"60\",\"price\":\"276000\",\"businessType\":\"SALE\",\"monthlyCondoFee\":\"0\"}}"
        
        let carouselView = CarouselView()
        let data = json.data(using: .utf8)!
        do {
            let f = try JSONDecoder().decode(Property.self, from: data)
            carouselView.property = f
            assertSnapshot(matching: carouselView, as: Snapshotting.image(size: CGSize(width: 400, height: 225)))
        } catch {
            print(error)
        }
    }
}
