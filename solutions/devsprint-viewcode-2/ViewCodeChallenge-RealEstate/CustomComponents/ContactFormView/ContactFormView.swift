//
//  ContactFormView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Bruna Fernanda Drago on 25/10/21.
//

import UIKit

protocol ContactFormViewDelegate : AnyObject {
    
    func didSelectSendButton()
}

class ContactFormView: UIView {
    
    // MARK: - Components
    
    private  let nameTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Nome"
        textfield.keyboardType = .default
        textfield.returnKeyType = .continue
        return textfield
    }()
    
    private let emailTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Email"
        textfield.keyboardType = .emailAddress
        textfield.returnKeyType = .done
        return textfield
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar contato", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: ContactFormViewDelegate?
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Func
    
    func getName() -> String {
        return nameTextField.text ?? ""
    }
    
    func getEmail() -> String {
        return emailTextField.text ?? ""
    }

    // MARK: - Private Func
    
    private func configure() {
        configureSubViews()
        configureConstraints()
        configureRender()
    }
    
    @objc private func didSelectSendButton(_ button: UIButton) {
        delegate?.didSelectSendButton()
    }
}

// MARK: - ContactFormView extension

extension ContactFormView {
    
    private func configureSubViews() {
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(sendButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            nameTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            nameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            sendButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            sendButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            sendButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            sendButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            sendButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func configureRender() {
        backgroundColor = .white
        
        let sendButtonAction = #selector(didSelectSendButton(_:))
        sendButton.addTarget(self, action: sendButtonAction, for: .touchUpInside)
    }
}
