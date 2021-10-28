//
//  ContactFormView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Diego Llopis on 22/10/21.
//

import UIKit

protocol ContactFormViewDelegate: AnyObject {
    func contactFormWantsToSubmit()
}

class ContactFormView: UIView {
    
    weak var delegate: ContactFormViewDelegate?
            
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .alphabet
        textField.placeholder = "Nome"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
   lazy var button: ButtonView = {
        button = ButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setButtonTitle("Enviar contato")
        button.delegate = self
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configView()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getName() -> String {
        self.nameTextField.text ?? ""
    }
    
    func getEmail() -> String {
        self.emailTextField.text ?? ""
    }
    
    func formatName() {
        self.nameTextField.text = self.getName().capitalized
    }
    
    func formatEmail() {
        self.emailTextField.text = self.getEmail().lowercased()
    }
    
    func formatTextFieldContent() {
        self.formatName()
        self.formatEmail()
    }
    
    func clearTextFields() {
        self.nameTextField.text = ""
        self.emailTextField.text = ""
    }
    
    func areTextFieldsEmpty() -> Bool {
        if self.getName() == "" && self.getEmail() == "" {
            return false
        } else {
            return true
        }
    }
    
    func sendContactConfirmation() {
        if areTextFieldsEmpty() {
            print("Contato enviado!")
            self.clearTextFields()
        } else {
            print("Preencher todos os campos!")
        }
    }
    
    func configView() {
        self.addSubview(self.nameTextField)
        self.addSubview(self.emailTextField)
        self.addSubview(self.button)
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            self.nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 50),


            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 15),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
            
            
            self.button.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.button.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ContactFormView: ButtonViewDelegate {

    func buttonPressAction(sender: ButtonView) {
        self.sendContactConfirmation()
    }
}

extension ContactFormView: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.formatTextFieldContent()
    }
            
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
