//
//  PropertyInfoCollectionViewCell.swift
//  RealEstateApp
//
//  Created by Amaryllis Baldrez on 04/05/22.
//

import Foundation
import UIKit

class PropertyInfoCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textAlignment = .left
        priceLabel.font = .boldSystemFont(ofSize: 22)
        priceLabel.textColor = .black
        return priceLabel
    }()
    
    public lazy var condominiumFeeLabel: UILabel = {
        let condominiumFeeLabel = UILabel()
        condominiumFeeLabel.translatesAutoresizingMaskIntoConstraints = false
        condominiumFeeLabel.textAlignment = .left
        condominiumFeeLabel.font = .boldSystemFont(ofSize: 14)
        condominiumFeeLabel.textColor = .black
        return condominiumFeeLabel
    }()

    private let urbanTaxLabel: UILabel = {
        let urbanTaxLabel = UILabel()
        urbanTaxLabel.translatesAutoresizingMaskIntoConstraints = false
        urbanTaxLabel.textAlignment = .left
        urbanTaxLabel.font = .boldSystemFont(ofSize: 14)
        urbanTaxLabel.textColor = .black
        return urbanTaxLabel
    }()

    public lazy var areaLabel: UILabel = {
        let areaLabel = UILabel()
        areaLabel.translatesAutoresizingMaskIntoConstraints = false
        areaLabel.textAlignment = .left
        areaLabel.font = .systemFont(ofSize: 14)
        areaLabel.textColor = .gray
        return areaLabel
    }()

    public lazy var bedroomsLabel: UILabel = {
        let bedroomsLabel = UILabel()
        bedroomsLabel.translatesAutoresizingMaskIntoConstraints = false
        bedroomsLabel.textAlignment = .left
        bedroomsLabel.font = .systemFont(ofSize: 14)
        bedroomsLabel.textColor = .gray
        return bedroomsLabel
    }()

    public lazy var bathroomsLabel: UILabel = {
        let bathroomsLabel = UILabel()
        bathroomsLabel.translatesAutoresizingMaskIntoConstraints = false
        bathroomsLabel.textAlignment = .left
        bathroomsLabel.font = .systemFont(ofSize: 14)
        bathroomsLabel.textColor = .gray
        return bathroomsLabel
    }()

    public lazy var garageLabel: UILabel = {
        let garageLabel = UILabel()
        garageLabel.translatesAutoresizingMaskIntoConstraints = false
        garageLabel.textAlignment = .left
        garageLabel.font = .systemFont(ofSize: 14)
        garageLabel.textColor = .gray
        return garageLabel
    }()

    public lazy var addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.textAlignment = .left
        addressLabel.font = .systemFont(ofSize: 14)
        addressLabel.textColor = .gray
        return addressLabel
    }()

func configureSubviews() {
    addSubview(priceLabel)
    addSubview(condominiumFeeLabel)
    addSubview(urbanTaxLabel)
    addSubview(areaLabel)
    addSubview(bedroomsLabel)
    addSubview(bathroomsLabel)
    addSubview(garageLabel)
    addSubview(addressLabel)
}

func configureSubviewsConstraints() {
   NSLayoutConstraint.activate([
        priceLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
        priceLabel.topAnchor.constraint(equalTo: self.topAnchor)
   ])
    
    NSLayoutConstraint.activate([
        condominiumFeeLabel.topAnchor.constraint(equalToSystemSpacingBelow: priceLabel.bottomAnchor, multiplier: 0.7),
        condominiumFeeLabel.leftAnchor.constraint(equalTo: priceLabel.leftAnchor)
    ])
    
    NSLayoutConstraint.activate([
        urbanTaxLabel.leftAnchor.constraint(equalToSystemSpacingAfter: condominiumFeeLabel.rightAnchor, multiplier: 3),
        urbanTaxLabel.topAnchor.constraint(equalTo: condominiumFeeLabel.topAnchor)
    ])
    
    NSLayoutConstraint.activate([
        areaLabel.topAnchor.constraint(equalTo: condominiumFeeLabel.bottomAnchor, constant: 3),
        areaLabel.leftAnchor.constraint(equalTo: condominiumFeeLabel.leftAnchor)
    ])
    
    NSLayoutConstraint.activate([
        bedroomsLabel.topAnchor.constraint(equalTo: areaLabel.topAnchor),
        bedroomsLabel.leftAnchor.constraint(equalToSystemSpacingAfter: areaLabel.rightAnchor, multiplier: 0.5)
    ])
    
    NSLayoutConstraint.activate([
        bathroomsLabel.topAnchor.constraint(equalTo: bedroomsLabel.topAnchor),
        bathroomsLabel.leftAnchor.constraint(equalToSystemSpacingAfter: bedroomsLabel.rightAnchor, multiplier: 0.5)
    ])
    
    NSLayoutConstraint.activate([
        garageLabel.topAnchor.constraint(equalTo: bathroomsLabel.topAnchor),
        garageLabel.leftAnchor.constraint(equalToSystemSpacingAfter: bathroomsLabel.rightAnchor, multiplier: 0.5)
    ])
    
    NSLayoutConstraint.activate([
        addressLabel.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 3),
        addressLabel.leftAnchor.constraint(equalTo: areaLabel.leftAnchor)
    ])
}
    
    
}
