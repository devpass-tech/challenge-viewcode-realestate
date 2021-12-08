//
//  LoadingView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Francischett Occhiuto on 08/12/21.
//

import UIKit

struct LoadingViewConfiguration {
    let labelText: String
}

final class LoadingView: UIView {

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
    
        return label
    }()
    
    private var loadIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .large)
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.startAnimating()
        return loading
    }()

    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabelLoadingView(with configuration: LoadingViewConfiguration) {
        label.text = configuration.labelText
    }
    
}

extension LoadingView: ViewCode {

    func configureSubviews() {
        addSubview(label)
        addSubview(loadIndicator)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadIndicator.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16)
        ])
    }

    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}
