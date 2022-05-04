//
//  DividerView.swift
//  RealEstateApp
//
//  Created by Anderson Oliveira on 04/05/22.
//

import Foundation
import UIKit

final class DividerView: UIView, ViewCode {

    init(){
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func configureSubviews() { }
    
    func configureSubviewsConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 1),
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1)
    }
}
