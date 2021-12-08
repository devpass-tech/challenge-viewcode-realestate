//
//  PropertyInfoView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Murillo R. Araújo on 07/12/21.
//

import UIKit

class PropertyInfoView: UIView {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 5
        return stack
    }()
    
    lazy var feesStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.spacing = 2
        return stack
    }()
    
    lazy var amenitiesStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 2
        return stack
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    lazy var condLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    lazy var iptuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    lazy var squareMetersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    lazy var bedroomLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    lazy var bathLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    lazy var parkingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with configuration: PropertyInfoConfiguration) {
        priceLabel.text = "R$ \(configuration.price)"
        condLabel.text = "Condomínio R$ \(configuration.condoFee ?? "0")"
        iptuLabel.text = "IPTU R$ \(configuration.iptu ?? "0")"
        squareMetersLabel.text = "\(configuration.usableAreas) m2"
        bedroomLabel.text = "\(configuration.bedrooms) quartos"
        bathLabel.text = "\(configuration.bathrooms) banheiros"
        parkingLabel.text = "\(configuration.parkingSpaces ?? 0) vagas"
        addressLabel.text = "\(configuration.address ?? "Sem endereço")"
    }
    
}

extension PropertyInfoView: ViewCode {
    
    func configureSubviews() {
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(feesStackView)
        stackView.addArrangedSubview(amenitiesStackView)
        stackView.addArrangedSubview(addressLabel)
        feesStackView.addArrangedSubview(condLabel)
        feesStackView.addArrangedSubview(iptuLabel)
        amenitiesStackView.addArrangedSubview(squareMetersLabel)
        amenitiesStackView.addArrangedSubview(bedroomLabel)
        amenitiesStackView.addArrangedSubview(bathLabel)
        amenitiesStackView.addArrangedSubview(parkingLabel)
        addSubview(stackView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
            
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}
