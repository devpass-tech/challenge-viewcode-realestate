//
//  ButtonView.swift
//  RealEstateApp
//
//  Created by Cora on 12/05/22.
//

import Foundation
import UIKit

class ButtonView: UIButton, ViewCode {
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .blue
        layer.cornerRadius = 8
    }
    
    func configureSubviews() {
    }
    
    func configureSubviewsConstraints() {
    }
}
