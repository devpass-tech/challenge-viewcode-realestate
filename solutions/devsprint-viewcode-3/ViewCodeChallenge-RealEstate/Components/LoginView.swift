//
//  LoginView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Fabio Martinez on 10/12/21.
//

import Foundation
import UIKit

final class LoginView: UIView {
    
    private var accountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login with your account"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
       return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.placeholder = "Email"
        textField.autocorrectionType = .no
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    private let loginButton: ButtonView = {
        let button = ButtonView()
        button.configure(with: .init(title: "Login"))
        return button
    }()
    
    private let resetPassawordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot password", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
                                                       accountLabel,
                                                       nameTextField,
                                                       emailTextField,
                                                       loginButton,
                                                       resetPassawordButton
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
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            resetPassawordButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func configureAdditionalBehaviors() {
        self.backgroundColor = .white
    }
}




    

