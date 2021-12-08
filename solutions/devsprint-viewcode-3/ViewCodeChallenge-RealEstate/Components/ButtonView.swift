//
//  ButtonView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Pedro Gabriel on 08/12/21.
//

import UIKit

struct ButtonViewConfiguration {
    let title: String
}

class ButtonView: UIView {
    // MARK: Properties
    private var button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.titleLabel?.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var pressedButton: (() -> Void)?
    
    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 50)
    }
    
    // MARK: Actions
    @objc
    private func buttonPressed() {
        pressedButton?()
    }
    
    // MARK: Methods
    func configure(with configuration: ButtonViewConfiguration) {
        button.setTitle(configuration.title, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
}

// MARK: ViewCode Setup
extension ButtonView: ViewCode {
    func configureSubviews() {
        addSubview(button)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureAdditionalBehaviors() {}
}
