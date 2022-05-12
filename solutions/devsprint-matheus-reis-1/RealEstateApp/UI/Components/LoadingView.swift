//
//  LoadingView.swift
//  RealEstateApp
//
//  Created by Cora on 10/05/22.
//

import Foundation
import UIKit

class LoadingView: UIView, ViewCode{
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Searching for listings..."
        title.textColor = .black
        title.font = .systemFont(ofSize: 18, weight: .bold)
        
        return title
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        
        return indicator
    }()
    
    private lazy var stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.spacing = 16
        
        return stackview
    }()
    
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggleAnimation() {
        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
        } else {
            activityIndicator.startAnimating()
        }
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
    
    func configureSubviews() {
        addSubview(stackview)
        [titleLabel, activityIndicator].forEach(stackview.addArrangedSubview)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackview.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackview.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
