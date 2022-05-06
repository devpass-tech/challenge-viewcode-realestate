//
//  PropertyInfoCollectionView.swift
//  RealEstateApp
//
//  Created by Amaryllis Baldrez on 04/05/22.
//

import Foundation
import UIKit

class PropertyInfoCollectionView: UICollectionView {
    
    init() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // make sure that there is a slightly larger gap at the top of each row
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        // set a standard item size of 60 * 60
        layout.itemSize = CGSize(width: 60, height: 60)
        // the layout scrolls horizontally
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
