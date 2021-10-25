//
//  PropertyInfoView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Alexandre Cardoso on 20/10/21.
//

import UIKit

class PropertyInfoView: UIView {
	
	// MARK: - UI Element
	private let contentView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .white
		return view
	}()
	
	private let propertyStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.distribution = .fillProportionally
		stackView.spacing = 5
		return stackView
	}()
	
	private let salePriceLabel: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.font = .systemFont(ofSize: 30, weight: .bold)
		label.numberOfLines = 1
		return label
	}()
	
	private let propertyValuesStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.distribution = .fillProportionally
		return stackView
	}()
	
	private let condominiumPriceLabel: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.font = .systemFont(ofSize: 17, weight: .regular)
		label.numberOfLines = 1
		return label
	}()
	
	private let IptuPriceLabel: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.font = .systemFont(ofSize: 17, weight: .regular)
		label.numberOfLines = 1
		return label
	}()
	
	private let propertyInfoStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.distribution = .fillProportionally
		return stackView
	}()
	
	private let footageLabel: UILabel = {
		let label = UILabel()
		label.textColor = .gray
		label.font = .systemFont(ofSize: 17, weight: .regular)
		label.numberOfLines = 1
		return label
	}()
	
	private let bedroomLabel: UILabel = {
		let label = UILabel()
		label.textColor = .gray
		label.font = .systemFont(ofSize: 17, weight: .regular)
		label.numberOfLines = 1
		return label
	}()
	
	private let bathroomLabel: UILabel = {
		let label = UILabel()
		label.textColor = .gray
		label.font = .systemFont(ofSize: 17, weight: .regular)
		label.numberOfLines = 1
		return label
	}()
	
	private let parkingSpacesLabel: UILabel = {
		let label = UILabel()
		label.textColor = .gray
		label.font = .systemFont(ofSize: 17, weight: .regular)
		label.numberOfLines = 1
		return label
	}()
	
	private let addressLabel: UILabel = {
		let label = UILabel()
		label.textColor = .gray
		label.font = .systemFont(ofSize: 17, weight: .regular)
		label.numberOfLines = 0
		return label
	}()
	
	
	// MARK: - Initialize
	override init(frame: CGRect) {
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
	
}
