//
//  EmptyView.swift
//  RealEstateApp
//
//  Created by Alliston Aleixo on 16/03/22.
//

import Foundation
import UIKit

struct EmptyViewConfiguration {
    var title: String
    var subtitle: String
}

final class EmptyView: UIView, ViewCode {
    // MARK: - Controls
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private let subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = .gray
        subtitleLabel.numberOfLines = 0
        return subtitleLabel
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    internal func updateView(with configuration: EmptyViewConfiguration) {
        titleLabel.text = configuration.title
        subtitleLabel.text = configuration.subtitle
    }
    
    // MARK: - ViewCode protocol
    internal func configureSubviews() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        
        addSubview(stackView)
    }
    
    internal func configureSubviewsConstraints() {
        let stackViewConstraints = [
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ]
        NSLayoutConstraint.activate(stackViewConstraints)
    }
    
    internal func configureAdditionalBehaviors() {
        subviews.forEach({ subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        })
    }
}
