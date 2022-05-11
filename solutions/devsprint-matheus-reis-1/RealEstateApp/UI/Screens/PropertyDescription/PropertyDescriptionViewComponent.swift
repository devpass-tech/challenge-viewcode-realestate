//
//  PropertyDescriptionViewComponent.swift
//  RealEstateApp
//
//  Created by Anderson Oliveira on 11/05/22.
//

import Foundation
import UIKit

final class PropertyDescriptionViewComponent: UIView, ViewCode {
    
    var delegate: PropertyDescriptionViewControllerProtocol?
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Descrição"
        title.font = .systemFont(ofSize: 16, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.numberOfLines = 5
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private lazy var seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ver mais", for: .normal)
        button.backgroundColor = UIColor(red: 66/255, green: 148/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(calFullDescription), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    @objc func calFullDescription(){
        guard let text =  descriptionLabel.text else { return }
        delegate?.callFullDescriptionView(descriptionLabel: text)
    }
    
    func configureSubviews() {
        [stackView].forEach(addSubview)
        [titleLabel,descriptionLabel,seeMoreButton].forEach(stackView.addArrangedSubview)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}



