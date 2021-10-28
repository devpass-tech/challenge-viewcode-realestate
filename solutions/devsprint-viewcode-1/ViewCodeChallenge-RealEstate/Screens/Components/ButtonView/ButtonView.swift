//
//  ButtonView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Diego Llopis on 21/10/21.
//

import UIKit

protocol ButtonViewDelegate: AnyObject {
    func buttonPressAction(sender: ButtonView)
}

class ButtonView: UIView {
    
    weak var delegate: ButtonViewDelegate?
        
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
    
    func setButtonTitle(_ titleLabel: String) {
        button.setTitle(titleLabel, for: .normal)
    }
    
    @objc func buttonPressed() {
        self.delegate?.buttonPressAction(sender: self)
    }
    
    private func configView() {
        self.addSubview(self.button)
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            self.button.topAnchor.constraint(equalTo: self.topAnchor),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
