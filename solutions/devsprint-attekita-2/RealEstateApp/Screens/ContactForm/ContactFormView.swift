//
//  ContactFormView.swift
//  RealEstateApp
//
//  Created by Bruno Silva on 17/03/22.
//

import UIKit

final class ContactFormView: UIView {
    
    // MARK: - Private UI Properties
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Tem interesse?"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "Nome"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "Email"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let sendContactButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("Enviar Contato", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
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
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(sendContactButton)
    }
    
    // MARK: - Public Methods
    func createContactWith(name: String, and email: String) {
        nameTextField.text = name
        emailTextField.text = email
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            sendContactButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
