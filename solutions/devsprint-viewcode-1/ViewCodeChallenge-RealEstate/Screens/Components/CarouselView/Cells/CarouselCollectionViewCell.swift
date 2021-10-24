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
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: CarouselCellViewModel) {
        self.imageView.image = UIImage(named: "\(viewModel.propertiesImages.images)")
    }
}

extension CarouselCollectionViewCell: ViewProtocol {
    func configureSubviews() {
        self.contentView.addSubview(self.imageView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    
}
