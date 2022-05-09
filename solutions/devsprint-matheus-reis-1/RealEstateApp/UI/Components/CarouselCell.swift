//
//  CarouselCell.swift
//  RealEstateApp
//
//  Created by Anderson Oliveira on 09/05/22.
//

import Foundation
import UIKit

final class CarouselCell: UICollectionViewCell, ViewCode {
    
    static var identifier = "CarouselCell"
    
    private lazy var imageCell: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(imageString: String){
        imageCell.image = UIImage(named: imageString)
    }
    
    func configureSubviews() {
        [imageCell].forEach(addSubview)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            imageCell.topAnchor.constraint(equalTo: topAnchor),
            imageCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCell.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureAdditionalBehaviors() {
    }
}
