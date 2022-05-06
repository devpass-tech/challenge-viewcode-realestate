//
//  PropertyInfoViewController.swift
//  RealEstateApp
//
//  Created by Amaryllis Baldrez on 03/05/22.
//

import Foundation
import UIKit

class PropertyInfoViewController: UIViewController {
    
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .red
                
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
                
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(PropertyInfoView.self, forCellWithReuseIdentifier: "MyCell")
        collectionView?.backgroundColor = UIColor.white
        view.addSubview(collectionView ?? UICollectionView())
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        self.view = view
    }
}

extension PropertyInfoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as? PropertyInfoView else { return UICollectionViewCell() }
            return cell
        }
}
