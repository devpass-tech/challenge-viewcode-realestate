//
//  ViewCode.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 06/12/21.
//

import UIKit

protocol ViewCode where Self: UIView {
    func configureSubviews()
    func configureSubviewsConstraints()
    func configureAdditionalBehaviors()
}

extension ViewCode {
    public func setupViews() {
        configureSubviews()
        configureSubviewsConstraints()
        configureAdditionalBehaviors()
    }
}
