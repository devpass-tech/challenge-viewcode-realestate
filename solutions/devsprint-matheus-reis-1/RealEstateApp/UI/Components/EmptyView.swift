//
//  EmptyView.swift
//  RealEstateApp
//
//  Created by Anderson Oliveira on 12/05/22.
//

import Foundation
import UIKit

final class EmptyView: UIView, ViewCode {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textAlignment = .center
        title.numberOfLines = 0
        title.text = "No listings found!"
        return title
    }()
    
    private lazy var textLabel: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 18)
        text.textAlignment = .center
        text.textColor = .systemGray
        text.numberOfLines = 0
        text.text =  "Search for cities and neighborhoods using the search bar above"
        return text
    }()
    
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: EmptyViewConfiguration) {
        titleLabel.text = configuration.titleLabel
        textLabel.text = configuration.textLabel
    }
    
    func configureSubviews() {
        addSubview(stackView)
        [titleLabel,textLabel].forEach(stackView.addArrangedSubview)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}
