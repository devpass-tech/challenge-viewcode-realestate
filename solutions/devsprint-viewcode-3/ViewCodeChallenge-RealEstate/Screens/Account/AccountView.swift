//
//  AccountView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 14/12/21.
//

import UIKit

protocol AccountViewDelegate: AnyObject {
    func didTappedButton()
}

class AccountView: UIView {

    weak var delegate: AccountViewDelegate?

    private let accountStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 30
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "Account"
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "Login with your account"
        return label
    }()

    private let emailTextField: TextFieldView = {
        let textField = TextFieldView()
        textField.placeholder = "Email"
        return textField
    }()

    private let passwordTextField: TextFieldView = {
        let textField = TextFieldView()
        textField.placeholder = "Password"
        return textField
    }()

    private lazy var buttonView: ButtonView = {
        var completion: (() -> Void)?
        let config = ButtonViewConfiguration(title: "Login",
                                             pressedButton: completion)

        let button = ButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configure(with: config)
        button.pressedButton = {
            self.delegate?.didTappedButton()
        }
        return button
    }()

    private let forgotButtonView: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password", for: .normal)
        button.setTitleColor(.link, for: .normal)
        return button
    }()

     init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountView: ViewCode {
    func configureSubviews() {
        accountStack.addArrangedSubview(titleLabel)
        accountStack.addArrangedSubview(subTitleLabel)
        accountStack.addArrangedSubview(emailTextField)
        accountStack.addArrangedSubview(passwordTextField)
        accountStack.addArrangedSubview(buttonView)
        accountStack.addArrangedSubview(forgotButtonView)
        addSubview(accountStack)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            accountStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            accountStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            accountStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }

    func configureAdditionalBehaviors() {
        backgroundColor = .systemBackground
    }
}
