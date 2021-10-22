//
//  CarouselCollectionViewCell.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Elena Diniz on 19/10/21.
//

import UIKit

protocol CarouselCollectionViewCellProtocol: AnyObject {
    func getImages(with viewModel: CarouselCellViewModel)
}

class CarouselCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: CarouselCellViewModel) {
        self.imageView.image = UIImage(named: "\(viewModel.images)")
    }
}
