//
//  PropertyInfoView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Pedro Boga on 21/10/21.
//

import UIKit

class PropertyInfoView: UIView {
    
    lazy var propertyStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 5
        return stack
    }()
    
    lazy var pricesStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.spacing = 2
        return stack
    }()
    
    lazy var infosStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViews()
        configConstraints()
    }
    
    func configLabelsText(viewModel: PropertyInfoViewModel) {
        
        priceLabel.text = "R$ \(viewModel.price)"
        condLabel.text = "Condomínio R$ \(viewModel.monthlyCondoFee ?? "0")"
        iptuLabel.text = "IPTU R$ \(viewModel.yearlyIptu ?? "0")"
        squareMetersLabel.text = "\(viewModel.usableAreas) m2"
        bedroomLabel.text = "\(viewModel.bedroom) quartos"
        bathLabel.text = "\(viewModel.bathrooms) banheiros"
        parkingLabel.text = "\(viewModel.parkingSpaces ?? 0) vagas"
        addressLabel.text = "\(viewModel.address ?? "Sem endereço")"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        //addSubview(propertyStackView)
        propertyStackView.addArrangedSubview(priceLabel)
        propertyStackView.addArrangedSubview(pricesStackView)
        propertyStackView.addArrangedSubview(infosStackView)
        propertyStackView.addArrangedSubview(addressLabel)
        pricesStackView.addArrangedSubview(condLabel)
        pricesStackView.addArrangedSubview(iptuLabel)
        infosStackView.addArrangedSubview(squareMetersLabel)
        infosStackView.addArrangedSubview(bedroomLabel)
        infosStackView.addArrangedSubview(bathLabel)
        infosStackView.addArrangedSubview(parkingLabel)
        addSubview(propertyStackView)

    }
    
    private func configConstraints() {
        propertyStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            propertyStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            propertyStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            propertyStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            propertyStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
            
        ])
        
    }
    
}


