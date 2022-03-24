//
//  PropertyMoreDescriptionView.swift
//  RealEstateApp
//
//  Created by Camila Ribeiro Rodrigues on 21/03/22.
//

import UIKit

protocol PropertyMoreDescriptionViewProtocol {
	func configure(with textDescription: String)
}

final class PropertyMoreDescriptionView: UIView {
	private lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 16, weight: .regular)
		label.textAlignment = .left
		label.textColor = .black
		label.numberOfLines = 0
		label.lineBreakMode = .byClipping
		return label
	}()
	
	let scrollView: UIScrollView = {
		let scroll = UIScrollView()
		scroll.translatesAutoresizingMaskIntoConstraints = false
		scroll.showsVerticalScrollIndicator = true
		return scroll
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setup() {
		configureSubview()
		configureConstraints()
	}
	
	private func configureSubview() {
		self.backgroundColor = .white
		addSubview(scrollView)
		scrollView.addSubview(descriptionLabel)
	}
	
	private func configureConstraints() {
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
			scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
			scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
			
			descriptionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
			descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			descriptionLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
		])
	}
}

extension PropertyMoreDescriptionView: PropertyMoreDescriptionViewProtocol {
	func configure(with textDescription: String) {
		descriptionLabel.text = textDescription
	}
}
