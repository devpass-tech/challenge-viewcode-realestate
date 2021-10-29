//
//  CarouselView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Alan Silva on 18/10/21.
//

import Foundation
import UIKit

final class PropertyCollectionView: UIView {
    
// MARK: - UIView
    lazy var corouselCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isUserInteractionEnabled = true
        collectionView.register(PropertyCollectionCell.self, forCellWithReuseIdentifier: PropertyCollectionCell.reuseID)
        layout.itemSize = CGSize(width: 375, height: 200 / 2)
        layout.minimumLineSpacing = 1
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return collectionView
    }()
    
    private var carouselData = [Property]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configureSubviews() {
        addSubview(self.corouselCollectionView)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            corouselCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            corouselCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            corouselCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            corouselCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - extension UICollectionViewDelegate, UICollectionViewDataSource
extension PropertyCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return carouselData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselData[section].images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: PropertyCollectionCell? = collectionView.dequeueReusableCell(withReuseIdentifier: PropertyCollectionCell.reuseID, for: indexPath) as?  PropertyCollectionCell
        
        cell?.setup(image: carouselData[indexPath.section].images[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}


