//
//  PropertyDescriptionView.swift
//  RealEstateApp
//
//  Created by Anderson Oliveira on 05/05/22.
//

import Foundation
import UIKit

protocol PropertyDescriptionViewProtocol {
    func updateDescription(description: String)
}

final class PropertyDescriptionView: UIView, PropertyDescriptionViewProtocol, ViewCode {
    
    private let divider = DividerView()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Descrição"
        title.font = .systemFont(ofSize: 22, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.numberOfLines = 0
        description.font = .systemFont(ofSize: 20)
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDescription(description: String) {
        descriptionLabel.text = description
    }
    
    func configureSubviews() {
        backgroundColor = .white
    }
    
    func configureSubviewsConstraints() {
        [titleLabel,descriptionLabel,divider,descriptionLabel].forEach(addSubview)
    }
    
    func configureAdditionalBehaviors() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            divider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
