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
        let collectionView = UICollectionView(frame: .zero)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

