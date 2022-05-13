//
//  ButtonView.swift
//  RealEstateApp
//
//  Created by Cora on 12/05/22.
//

import Foundation
import UIKit

struct ButtonViewConfiguration {
    var buttonText: String
}

class ButtonView: UIButton, ViewCode {
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: ButtonViewConfiguration) {
        setTitle(configuration.buttonText, for: .normal)
    }
    
    func configureAdditionalBehaviors() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blue
        layer.cornerRadius = 8
    }
    
    func configureSubviews() {
        
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            heightAnchor.constraint(equalToConstant: 42),
        ])
    }
}
