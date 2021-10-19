//
//  CarouselCollectionViewCell.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Elena Diniz on 19/10/21.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    let images: Property
    
    private lazy var imageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "\(images.images)")
        
        return imageView
    }()
    
    init(images: Property) {
        self.images = images
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
