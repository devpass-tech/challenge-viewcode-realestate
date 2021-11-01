//
//  PropoertyCollectionCell.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Alan Silva on 24/10/21.
//

import Foundation
import UIKit

final class PropertyCollectionCell: UICollectionViewCell {
    
    static let reuseID = "PropertyCollectionCell"
    
    let propertyImageView = UIImageView()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(propertyImageView)
        
        NSLayoutConstraint.activate([
            propertyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            propertyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            propertyImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            propertyImageView.heightAnchor.constraint(equalTo: propertyImageView.widthAnchor)
        ])
    }
    
    func setup(image: String){
        self.propertyImageView.image = UIImage(named: image)
    }
}
