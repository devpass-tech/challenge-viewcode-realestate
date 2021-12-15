//
//  ContactFormView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Guilherme Strutzki on 08/12/21.
//

import Foundation

final class ContactFormView: UIView {
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Tem interesse?"
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.placeholder = "Nome"
        textField.autocorrectionType = .no
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    private let submitButton: ButtonView = {
        let button = ButtonView()
        let buttonViewModel = ButtonViewConfiguration (title: "Enviar Contato", pressedButton: nil)
        button.configure(with: buttonViewModel)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,
                                                       nameTextField,
                                                       emailTextField,
                                                       submitButton
                                                      ])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.setCustomSpacing(20, after: titleLabel)
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

extension ContactFormView: ViewCode {
    func configureSubviews() {
        addSubview(stackView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configureAdditionalBehaviors() {}
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ContactFormViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let contactFormView = ContactFormView()
            return contactFormView
        }
        .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                              height: 250))
    }
}
#endif
