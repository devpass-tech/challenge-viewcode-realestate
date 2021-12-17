//
//  PropertyFullDescriptionView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Murillo R. Araújo on 13/12/21.
//

import UIKit

class PropertyFullDescriptionView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var dividerView: DividerView = {
        let view = DividerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = .black
        textView.isEditable = false
        textView.textAlignment = .justified
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with configuration: PropertyFullDescriptionConfiguration) {
        titleLabel.text = configuration.title
        descriptionView.text = configuration.description
    }
    
}

extension PropertyFullDescriptionView: ViewCode {
    
    func configureSubviews() {
        addSubview(titleLabel)
        addSubview(dividerView)
        addSubview(descriptionView)
    }
    
    func configureSubviewsConstraints() {
        let margins = self.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            dividerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            dividerView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            descriptionView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 20),
            descriptionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            descriptionView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct PropertyFullDescriptionViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let propertyFullDescriptionView = PropertyFullDescriptionView()
            let configuration = PropertyFullDescriptionConfiguration(title: "Descrição", description: "Apartamento INTEIRAMENTE REFORMADO e recentemente. Com acabamentos e materiais de primeira qualidade. Um estilo industrial e elegante com personalidade (assinado pelo arquiteto Cyro Guimarães). Objetos de design e muito verde! Sala grande, piso (taco) de madeira tratado, todos armários e estante novos, quartos e banheiros espaçosos. Vagas: possibilidade de alugar uma segunda (2a) vaga de garagem por R$ 200 reais mensais. Além da vaga que possui na escritura. Ensolarado, iluminado e ventilado. Estamos no 8o andar, com uma certa vista e sem barulhos. Paredes grossas, não da para escutar barulhos externos nem dos vizinhos. Prédio calmo e com uma vizinhança amigável e gentil. Além do condominio ser um valor baixo! (R$ 1.100). Bem localizado, no coração dos JARDINS, em frente a Velocity, do lado da melhor padaria do bairro (PAO), próximo as academias Bodytech / Firts e a alguns dos melhores restaurantes da cidade: EMA, Le jazz, Ristorantino, Tavares, MYK, SPOT, Ritz, entre outros.")
            
            propertyFullDescriptionView.configure(with: configuration)
            
            return propertyFullDescriptionView
        }
    }
}
#endif
