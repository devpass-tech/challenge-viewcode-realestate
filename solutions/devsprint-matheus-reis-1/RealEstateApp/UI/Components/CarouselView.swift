//
//  CarouselView.swift
//  RealEstateApp
//
//  Created by Cora on 09/05/22.
//

import Foundation
import UIKit

final class CarouselView: UIView, ViewCode  {
    
    var images: [String]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.identifier)
        collection.isPagingEnabled = true
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    init(images: [String]) {
        self.images = images
        super.init(frame: .zero)
        setupViews()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureSubviews() {
        [collectionView].forEach(addSubview)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureAdditionalBehaviors() {
    }
    
}


extension CarouselView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let carouselImage = images[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.identifier, for: indexPath) as! CarouselCell
        cell.updateCell(imageString: carouselImage)
        return cell
    }
}
