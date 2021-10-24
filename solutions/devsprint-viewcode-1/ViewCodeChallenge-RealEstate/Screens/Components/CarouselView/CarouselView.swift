//
//  CarouselView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Elena Diniz on 19/10/21.
//

import UIKit

class CarouselView: UIView {
    
    let layout = UICollectionViewFlowLayout()
    
    weak var delegate: CarouselCollectionViewCellProtocol?
    
    var properties: Property?
    let images: [String] = ["pic1", "pic2", "pic3", "pic4", "pic5", "pic6", "pic7", "pic8", "pic9", "pic10", "pic11", "pic12", "pic13", "pic14", "pic15", "pic16", "pic17", "pic18", "pic19", "pic20"]
    
    private lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: "CarouselViewCell")
        collectionView.isUserInteractionEnabled = true
        layout.itemSize = CGSize(width: 375, height: 200 / 2)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        return collectionView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
//        self.properties = properties
        configureView()
        configureConstraints()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: CarouselCellViewModel) {
        self.properties = viewModel.propertiesImages
        self.collectionView.reloadData()
    }
}

//MARK: - SetupView Protocol Properties
extension CarouselView: ViewProtocol {
    func configureSubviews() {
        self.backgroundColor = .white
        self.addSubview(self.collectionView)
        self.layout.scrollDirection = .horizontal
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

//MARK: - Collection View Properties
extension CarouselView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return properties?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CarouselCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselViewCell", for: indexPath) as? CarouselCollectionViewCell
        
        cell?.imageView.image = UIImage(named: "\(String(describing: properties?.images[indexPath.row]))")
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

extension CarouselView: CarouselCollectionViewCellProtocol {
    func getImages(with viewModel: CarouselCellViewModel) {
        self.properties = viewModel.propertiesImages
        self.collectionView.reloadData()
    }
    
    
}
