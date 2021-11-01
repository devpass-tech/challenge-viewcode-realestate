//
//  ViewProtocol.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Elena Diniz on 19/10/21.
//

import UIKit

protocol ViewProtocol: UIView {
    func configureView()
    func configureSubviews()
    func configureConstraints()
}

extension ViewProtocol {
    func configureView() {
        configureSubviews()
        configureConstraints()
    }
}
