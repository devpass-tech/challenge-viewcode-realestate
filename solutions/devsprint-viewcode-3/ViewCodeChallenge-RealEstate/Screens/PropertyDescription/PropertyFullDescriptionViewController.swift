//
//  PropertyFullDescriptionViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Murillo R. Araújo on 13/12/21.
//

import UIKit

class PropertyFullDescriptionViewController: UIViewController {
    
    let propertyFullDescriptionView: PropertyFullDescriptionView = {
        let propertyFullDescriptionView = PropertyFullDescriptionView()
        let configuration = PropertyFullDescriptionConfiguration(title: "Descrição", description: "Apartamento INTEIRAMENTE REFORMADO e recentemente. Com acabamentos e materiais de primeira qualidade. Um estilo industrial e elegante com personalidade (assinado pelo arquiteto Cyro Guimarães). Objetos de design e muito verde! Sala grande, piso (taco) de madeira tratado, todos armários e estante novos, quartos e banheiros espaçosos. Vagas: possibilidade de alugar uma segunda (2a) vaga de garagem por R$ 200 reais mensais. Além da vaga que possui na escritura. Ensolarado, iluminado e ventilado. Estamos no 8o andar, com uma certa vista e sem barulhos. Paredes grossas, não da para escutar barulhos externos nem dos vizinhos. Prédio calmo e com uma vizinhança amigável e gentil. Além do condominio ser um valor baixo! (R$ 1.100). Bem localizado, no coração dos JARDINS, em frente a Velocity, do lado da melhor padaria do bairro (PAO), próximo as academias Bodytech / Firts e a alguns dos melhores restaurantes da cidade: EMA, Le jazz, Ristorantino, Tavares, MYK, SPOT, Ritz, entre outros.")
        
        propertyFullDescriptionView.configure(with: configuration)
        
        return propertyFullDescriptionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = self.propertyFullDescriptionView
    }
}
