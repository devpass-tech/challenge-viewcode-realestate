//
//  ContactFormView.swift
//  RealEstateApp
//
//  Created by Bruno Silva on 17/03/22.
//

import UIKit

final class ContactFormView: UIView {
    
    // MARK: - Private Properties
    lazy var titleLabel = createTitleLabel()
    lazy var nameTextField = createNameTextField()
    lazy var emailTextField = createEmailTextField()
    lazy var sendContactButton = createSendContactButton()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setup() {
        setupViews()
        setupBackgroundColor()
        setupConstraints()
    }
    
    private func setupBackgroundColor() {
        backgroundColor = .white
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(sendContactButton)
    }
    
    // MARK: - Private Methods
    private func createTitleLabel() -> UILabel {
        let label: UILabel = UILabel()
        label.text = "Tem interesse?"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createNameTextField() -> UITextField {
        let textField: UITextField = UITextField()
        textField.placeholder = "Nome"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private func createEmailTextField() -> UITextField {
        let textField: UITextField = UITextField()
        textField.placeholder = "Email"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private func createSendContactButton() -> UIButton {
        let button: UIButton = UIButton()
        button.setTitle("Enviar Contato", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    // MARK: - Public Methods
    func createContactWith(name: String, and email: String) {
        nameTextField.text = name
        emailTextField.text = email
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            sendContactButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            sendContactButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sendContactButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            sendContactButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            sendContactButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
