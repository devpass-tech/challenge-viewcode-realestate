//
//  CarouselView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Elena Diniz on 19/10/21.
//

import UIKit

class CarouselView: UIView {
    
    let layout = UICollectionViewFlowLayout()
    
    private let stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    private lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CarouselViewCell")
        self.layout.scrollDirection = .horizontal
        
        return collectionView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        configureView()
        configureConstraints()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CarouselView: ViewProtocol {
    func configureSubviews() {
        self.backgroundColor = .white
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.collectionView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension CarouselView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselViewCell", for: indexPath)
        
        return cell
    }
    
    
    
}
