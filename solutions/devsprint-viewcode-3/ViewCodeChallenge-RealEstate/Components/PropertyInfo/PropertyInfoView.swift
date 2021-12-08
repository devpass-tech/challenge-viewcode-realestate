//
//  PropertyInfoView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Murillo R. Araújo on 07/12/21.
//

import UIKit

class PropertyInfoView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 5
        return stack
    }()
    
    private lazy var feesStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    private lazy var amenitiesStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    private lazy var feesSpacerView: UIView = {
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return spacer
    }()
    
    private lazy var amenitiesSpacerView: UIView = {
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return spacer
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var condLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var iptuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var squareMetersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var bedroomLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var bathLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var parkingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15)
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
        feesStackView.addArrangedSubview(feesSpacerView)
        amenitiesStackView.addArrangedSubview(squareMetersLabel)
        amenitiesStackView.addArrangedSubview(bedroomLabel)
        amenitiesStackView.addArrangedSubview(bathLabel)
        amenitiesStackView.addArrangedSubview(parkingLabel)
        amenitiesStackView.addArrangedSubview(amenitiesSpacerView)
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
