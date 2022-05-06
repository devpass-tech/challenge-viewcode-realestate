//
//  PropertyInfoView.swift
//  RealEstateApp
//
//  Created by Amaryllis Baldrez on 03/05/22.
//

import UIKit

class PropertyInfoView: UIView, ViewCode {
    
    private lazy var collectionView: PropertyInfoCollectionView = {
        let collectionView = PropertyInfoCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()

    func configureSubviews() {
        self.addSubview(collectionView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configureAdditionalBehaviors() {
        
    }
    
    
}
