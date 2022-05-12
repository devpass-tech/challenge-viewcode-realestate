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

class ButtonView: UIView, ViewCode {
    lazy var buttonView: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: ButtonViewConfiguration) {
        buttonView.setTitle(configuration.buttonText, for: .normal)
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
    
    func configureSubviews() {
        addSubview(buttonView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            buttonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            buttonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            buttonView.heightAnchor.constraint(equalToConstant: 42),
        ])
    }
}
