//
//  ContactFormView.swift
//  RealEstateApp
//
//  Created by Cora on 03/05/22.
//

import UIKit

class ContactFormView: UIView {
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tem interesse?"
        
        return label
    }()
    
    lazy var name: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Name"
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 0.8
        textfield.layer.cornerRadius = 2
        
        return textfield
    }()
    
    lazy var email: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Email"
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 0.8
        textfield.layer.cornerRadius = 2
        
        return textfield
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.setTitle("Enviar contato", for: .normal)
        btn.layer.cornerRadius = 8
        
        return btn
    }()
    
    init() {
        super.init(frame: .zero)
        configViews()
        buildViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        
    }
    
    func buildViews() {
        [title, name, email, button].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            name.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 36),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 24),
            email.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            email.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            button.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 24),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
