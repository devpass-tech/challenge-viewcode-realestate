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
    private var apiClient = RealEstateAPIClient()
    private var property = [Property]()
    
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
        
        apiClient.fetchProperties { property in
            self.property = property
            self.collectionView.reloadData()
        }
        
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
        return property.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! PropertyInfoCollectionViewCell
        
        cell.priceLabel.attributedText = NSAttributedString(string: "R$ " + property[indexPath.row].pricingInfos.price)
        cell.areaLabel.attributedText = NSAttributedString(string: String(property[indexPath.row].usableAreas)  + "m²")
        cell.bedroomsLabel.attributedText = NSAttributedString(string: String(property[indexPath.row].bedrooms)  + " quartos")
        cell.bathroomsLabel.attributedText = NSAttributedString(string: String(property[indexPath.row].bathrooms)  + " banheiros")
        cell.addressLabel.attributedText = NSAttributedString(string: property[indexPath.row].address.neighborhood)
        if let monthlyCondoFee = property[indexPath.row].pricingInfos.monthlyCondoFee {
            cell.condominiumFeeLabel.attributedText = NSAttributedString(string: "Condomínio R$ " + monthlyCondoFee)
        }
        if let yearlyIptu = property[indexPath.row].pricingInfos.yearlyIptu {
            cell.condominiumFeeLabel.attributedText = NSAttributedString(string: "IPTU R$ " + yearlyIptu)
        }
        if let parkingSpaces = property[indexPath.row].parkingSpaces {
            cell.garageLabel.attributedText = NSAttributedString(string: String(parkingSpaces) + " vagas")
        }
        return cell
    }
}
