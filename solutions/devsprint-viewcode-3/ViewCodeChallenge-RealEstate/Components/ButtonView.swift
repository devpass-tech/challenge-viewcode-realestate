//
//  ButtonView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Pedro Gabriel on 08/12/21.
//

import UIKit

struct ButtonViewConfiguration {
    let title: String
    var pressedButton: (() -> Void)?
}

class ButtonView: UIView {
    // MARK: Properties
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.titleLabel?.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitle(configuration.title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private var pressedButton: (() -> Void)?
    private var configuration: ButtonViewConfiguration
    
    // MARK: Initializers
    init(with configuration: ButtonViewConfiguration) {
        self.configuration = configuration
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
        configuration.pressedButton?()
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

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ButtonViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let configuration = ButtonViewConfiguration(title: "Ver mais") {
                print("do Something!")
            }
            let buttonView = ButtonView(with: configuration)
            return buttonView
        }
        .padding(.horizontal, 15)
        .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 60))
    }
}
#endif
