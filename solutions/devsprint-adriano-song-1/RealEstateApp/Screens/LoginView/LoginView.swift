//
//  LoginView.swift
//  RealEstateApp
//
//  Created by Fabio Martinez on 17/02/22.
//

import Foundation
import UIKit


final class LoginView: UIView {
    
    private var accountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login with you account"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.placeholder = "Type your E-mail"
        textField.autocorrectionType = .no
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textAlignment = .center
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.placeholder = "Type your Password"
        textField.autocorrectionType = .no
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.isSecureTextEntry = true
        textField.textAlignment = .center
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let resetPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot my Password", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
                                                        accountLabel,
                                                        emailTextField,
                                                        loginButton,
                                                        passwordTextField,
                                                        loginButton,
                                                        resetPasswordButton
                                                        ])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.setCustomSpacing(20, after: accountLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: ViewCode {
    func configureSubviews() {
        addSubview(stackView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            accountLabel.heightAnchor.constraint(equalToConstant: 30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configureAdditionalBehaviors() {
        self.backgroundColor = .white
    }
}
