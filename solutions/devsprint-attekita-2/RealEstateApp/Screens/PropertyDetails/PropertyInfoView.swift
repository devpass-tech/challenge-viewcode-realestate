//
//  PropertyInfoView.swift
//  RealEstateApp
//
//  Created by Alliston Aleixo on 14/03/22.
//

import UIKit

class PropertyInfoView: UIView, ViewCode {
    // MARK: - Controls
    private let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .top
        mainStackView.spacing = 10
        return mainStackView
    }()
    
    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textAlignment = .left
        priceLabel.font = .boldSystemFont(ofSize: 22)
        priceLabel.textColor = .black
        
        return priceLabel
    }()
    
    private let otherPricesStackView: UIStackView = {
        let otherPricesStackView = UIStackView()
        otherPricesStackView.axis = .horizontal
        otherPricesStackView.alignment = .leading
        otherPricesStackView.spacing = 12
        return otherPricesStackView
    }()
    
    private let condominiumFeeLabel: UILabel = {
        let condominiumFeeLabel = UILabel()
        condominiumFeeLabel.textAlignment = .left
        condominiumFeeLabel.font = .boldSystemFont(ofSize: 14)
        condominiumFeeLabel.textColor = .black
        
        return condominiumFeeLabel
    }()
    
    private let urbanTaxLabel: UILabel = {
        let urbanTaxLabel = UILabel()
        urbanTaxLabel.textAlignment = .left
        urbanTaxLabel.font = .boldSystemFont(ofSize: 14)
        urbanTaxLabel.textColor = .black
        
        return urbanTaxLabel
    }()
    
    private let detailsStackView: UIStackView = {
        let detailsStackView = UIStackView()
        detailsStackView.axis = .horizontal
        detailsStackView.alignment = .leading
        detailsStackView.spacing = 12
        return detailsStackView
    }()
    
    private let areaLabel: UILabel = {
        let areaLabel = UILabel()
        areaLabel.textAlignment = .left
        areaLabel.font = .systemFont(ofSize: 14)
        areaLabel.textColor = .gray
        
        return areaLabel
    }()
    
    private let bedroomsLabel: UILabel = {
        let bedroomsLabel = UILabel()
        bedroomsLabel.textAlignment = .left
        bedroomsLabel.font = .systemFont(ofSize: 14)
        bedroomsLabel.textColor = .gray
        
        return bedroomsLabel
    }()
    
    private let bathroomsLabel: UILabel = {
        let bathroomsLabel = UILabel()
        bathroomsLabel.textAlignment = .left
        bathroomsLabel.font = .systemFont(ofSize: 14)
        bathroomsLabel.textColor = .gray
        
        return bathroomsLabel
    }()
    
    private let garageLabel: UILabel = {
        let garageLabel = UILabel()
        garageLabel.textAlignment = .left
        garageLabel.font = .systemFont(ofSize: 14)
        garageLabel.textColor = .gray
        
        return garageLabel
    }()
    
    private let addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.textAlignment = .left
        addressLabel.font = .systemFont(ofSize: 14)
        addressLabel.textColor = .gray
        
        return addressLabel
    }()
    
    // MARK: - Init
    init(
        price: String,
        condominiumFee: Decimal? = nil,
        urbanTax: Decimal? = nil,
        area: Int,
        bedrooms: Int,
        bathrooms: Int,
        garage: Int,
        address: String? = nil,
        frame: CGRect = CGRect.zero
    ) {
        priceLabel.text = price
        
        let resultCondominiumFee = condominiumFee ?? 0
        condominiumFeeLabel.text = "Condomínio R$ \(resultCondominiumFee)"
        
        let resultUrbanTax = urbanTax ?? 0
        urbanTaxLabel.text = "IPTU R$ \(resultUrbanTax)"
        
        areaLabel.text = "\(area) m²"
        bedroomsLabel.text = "\(bedrooms) quartos"
        bathroomsLabel.text = "\(bathrooms) banheiros"
        garageLabel.text = "\(garage) vagas"
        
        let resultAddress = address ?? "Sem endereço"
        addressLabel.text = resultAddress
        
        super.init(frame: frame)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewCode protocol
    func configureSubviews() {
        mainStackView.addArrangedSubview(priceLabel)
        
        otherPricesStackView.addArrangedSubview(condominiumFeeLabel)
        otherPricesStackView.addArrangedSubview(urbanTaxLabel)
        mainStackView.addArrangedSubview(otherPricesStackView)
        
        detailsStackView.addArrangedSubview(areaLabel)
        detailsStackView.addArrangedSubview(bedroomsLabel)
        detailsStackView.addArrangedSubview(bathroomsLabel)
        detailsStackView.addArrangedSubview(garageLabel)
        
        mainStackView.addArrangedSubview(detailsStackView)
        mainStackView.addArrangedSubview(addressLabel)
        
        addSubview(mainStackView)
    }
    
    func configureSubviewsConstraints() {
        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 15)
        ]
        NSLayoutConstraint.activate(mainStackViewConstraints)
    }
    
    func configureAdditionalBehaviors() {
        subviews.forEach({ subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        })
    }
}
