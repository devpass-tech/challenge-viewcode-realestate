//
//  PropertyInfoViewController.swift
//  RealEstateApp
//
//  Created by Amaryllis Baldrez on 04/05/22.
//

import Foundation
import UIKit

class PropertyInfoViewController: UIViewController {
    
    private var propertyInfoView = PropertyInfoView()
    
    override func loadView() {
        self.view = propertyInfoView
    }
    
    private lazy var collectionView: PropertyInfoCollectionView = {
        let collectionView = PropertyInfoCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .red
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(PropertyInfoCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
        addSubviews()
    }
    
    func addSubviews() {
        view.addSubview(collectionView)
    
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}

extension PropertyInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! PropertyInfoCollectionViewCell
        return cell
    }
}
