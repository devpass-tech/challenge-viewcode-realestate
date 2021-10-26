//
//  DividerView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Bruna Fernanda Drago on 24/10/21.
//

import UIKit

class DividerView: UIView {
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(backgroundColor: UIColor, height: CGFloat) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Func
    
    private func configure() {
        self.backgroundColor = .lightGray
        self.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
    }
}


