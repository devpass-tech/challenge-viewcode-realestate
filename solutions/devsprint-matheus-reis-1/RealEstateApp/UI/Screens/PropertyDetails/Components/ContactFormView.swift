//
//  ContactFormView.swift
//  RealEstateApp
//
//  Created by Cora on 03/05/22.
//

import UIKit

class ContactFormView: UIView, ViewCode {
     
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tem interesse?"
        label.textColor = .darkText
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "  Nome"
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 0.8
        textfield.layer.cornerRadius = 2
        
        return textfield
    }()
    
    lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "  Email"
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 0.8
        textfield.layer.cornerRadius = 2
        
        return textfield
    }()
    
    lazy var sendbutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Enviar contato", for: .normal)
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
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
    
    func configureSubviews() {
        [titleLabel, nameTextField, emailTextField, sendbutton].forEach(addSubview)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 36),
            nameTextField.heightAnchor.constraint(equalToConstant: 36),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 24),
            emailTextField.heightAnchor.constraint(equalToConstant: 36),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            sendbutton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
            sendbutton.heightAnchor.constraint(equalToConstant: 42),
            sendbutton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            sendbutton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
