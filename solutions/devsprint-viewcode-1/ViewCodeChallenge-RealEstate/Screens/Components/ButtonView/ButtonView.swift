//
//  ButtonView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Diego Llopis on 21/10/21.
//

import UIKit

protocol ButtonViewProtocol: AnyObject {
    func buttonPressAction()
}

class ButtonView: UIView {
    
    weak var delegate: ButtonViewProtocol?
    
    func buttonViewDelegate(delegate: ButtonViewProtocol?) {
        self.delegate = delegate
    }
        
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
    
    func setButtonTitle(_ title: String) {
        button.setTitle(title, for: .normal)
    }
    
    @objc func buttonPressed() {
        self.delegate?.buttonPressAction()
    }
    
    private func configView() {
        self.addSubview(self.button)
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            self.button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
