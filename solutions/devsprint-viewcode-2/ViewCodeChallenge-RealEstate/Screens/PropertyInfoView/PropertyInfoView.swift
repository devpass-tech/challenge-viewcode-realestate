//
//  PropertyInfoView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Alexandre Cardoso on 20/10/21.
//

import UIKit

class PropertyInfoView: UIView {
	
	// MARK: - UI Element
	private let contentView: UIView
	private let propertyStackView: UIStackView
	private let salePriceLabel: UILabel
	private let propertyValuesStackView: UIStackView
	private let condominiumPriceLabel: UILabel
	private let IptuPriceLabel: UILabel
	private let propertyInfoStackView: UIStackView
	private let footageLabel: UILabel
	private let bedroomLabel: UILabel
	private let bathroomLabel: UILabel
	private let parkingSpacesLabel: UILabel
	private let addressLabel: UILabel
	
	
	// MARK: - Initialize
	override init(frame: CGRect) {
		contentView = UIView()
		propertyStackView = UIStackView()
		salePriceLabel = UILabel()
		propertyValuesStackView = UIStackView()
		condominiumPriceLabel = UILabel()
		IptuPriceLabel = UILabel()
		propertyInfoStackView = UIStackView()
		footageLabel = UILabel()
		bedroomLabel = UILabel()
		bathroomLabel = UILabel()
		parkingSpacesLabel = UILabel()
		addressLabel = UILabel()
		
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Function
	private func setupView() {
		configureSubviews()
		configureConstraints()
		configureRender()
	}
	
	func configure(with viewModel: PropertyInfoViewModel) {
		salePriceLabel.text = "R$ \(viewModel.salePrice)"
		condominiumPriceLabel.text = "Condominio R$ \(viewModel.condominiumPrice)"
		IptuPriceLabel.text = "IPTU R$ \(viewModel.IptuPrice)"
		footageLabel.text = "\(viewModel.footage) m²"
		bedroomLabel.text = "\(viewModel.bedroom) quartos"
		bathroomLabel.text = "\(viewModel.bathroom) banheiros"
		parkingSpacesLabel.text = "\(viewModel.parkingSpaces) vagas"
		addressLabel.text = viewModel.address
	}
}

extension PropertyInfoView {
	
	private func configureSubviews() {
		propertyValuesStackView.addArrangedSubview(condominiumPriceLabel)
		propertyValuesStackView.addArrangedSubview(IptuPriceLabel)
		propertyInfoStackView.addArrangedSubview(footageLabel)
		propertyInfoStackView.addArrangedSubview(bedroomLabel)
		propertyInfoStackView.addArrangedSubview(bathroomLabel)
		propertyInfoStackView.addArrangedSubview(parkingSpacesLabel)
		propertyStackView.addArrangedSubview(salePriceLabel)
		propertyStackView.addArrangedSubview(propertyValuesStackView)
		propertyStackView.addArrangedSubview(propertyInfoStackView)
		propertyStackView.addArrangedSubview(addressLabel)
		contentView.addSubview(propertyStackView)
		
		addSubview(contentView)
	}
	
	private func configureConstraints() {
		contentView.translatesAutoresizingMaskIntoConstraints = false
		propertyStackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: topAnchor),
			contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			propertyStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			propertyStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			propertyStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			propertyStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
		])
	}
	
	private func configureRender() {
		contentView.backgroundColor = .white
		
		propertyStackView.axis = .vertical
		propertyStackView.distribution = .fillProportionally
		propertyStackView.spacing = 5
		
		salePriceLabel.textColor = .black
		salePriceLabel.font = .systemFont(ofSize: 30, weight: .bold)
		salePriceLabel.numberOfLines = 1

		propertyValuesStackView.axis = .horizontal
		propertyValuesStackView.distribution = .fillProportionally
		
		condominiumPriceLabel.textColor = .black
		condominiumPriceLabel.font = .systemFont(ofSize: 17, weight: .regular)
		condominiumPriceLabel.numberOfLines = 1

		IptuPriceLabel.textColor = .black
		IptuPriceLabel.font = .systemFont(ofSize: 17, weight: .regular)
		IptuPriceLabel.numberOfLines = 1

		propertyInfoStackView.axis = .horizontal
		propertyInfoStackView.distribution = .fillProportionally
		
		footageLabel.textColor = .gray
		footageLabel.font = .systemFont(ofSize: 17, weight: .regular)
		footageLabel.numberOfLines = 1

		bedroomLabel.textColor = .gray
		bedroomLabel.font = .systemFont(ofSize: 17, weight: .regular)
		bedroomLabel.numberOfLines = 1
		
		bathroomLabel.textColor = .gray
		bathroomLabel.font = .systemFont(ofSize: 17, weight: .regular)
		bathroomLabel.numberOfLines = 1
		
		parkingSpacesLabel.textColor = .gray
		parkingSpacesLabel.font = .systemFont(ofSize: 17, weight: .regular)
		parkingSpacesLabel.numberOfLines = 1
		
		addressLabel.textColor = .gray
		addressLabel.font = .systemFont(ofSize: 17, weight: .regular)
		addressLabel.numberOfLines = 0
	}
	
}
