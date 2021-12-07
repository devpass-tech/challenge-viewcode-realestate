//
//  CarouselView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 06/12/21.
//

import UIKit

class CarouselView: UIView {
    // MARK: Lifecycle

    init() {
        super.init(frame: .zero)
        configureSubviews()
        configureSubviewsConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Internal

    var dataSource: [UIImage?] = []

    func configure(with dataSource: [UIImage?], at page: Int) {
        self.dataSource = dataSource
        self.page = page
    }

    // MARK: Private

    private var page = 0

    private lazy var carouselCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.identifier)
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .systemMint
        view.accessibilityIdentifier = "carousel-CollectionView"
        return view
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundStyle = .prominent
        pageControl.accessibilityIdentifier = "page-Control"
        return pageControl
    }()
}

// MARK: - ViewCode

extension CarouselView: ViewCode {
    func configureSubviews() {
        addSubview(carouselCollectionView)
        addSubview(pageControl)
        bringSubviewToFront(pageControl)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            carouselCollectionView.topAnchor.constraint(equalTo: topAnchor),
            carouselCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            carouselCollectionView.heightAnchor.constraint(equalToConstant: 160),

            pageControl.topAnchor.constraint(equalTo: carouselCollectionView.bottomAnchor, constant: -30),
            pageControl.leadingAnchor.constraint(equalTo: carouselCollectionView.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: carouselCollectionView.trailingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureAdditionalBehaviors()
    }

    func configureAdditionalBehaviors() {
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        carouselLayout.itemSize = .init(width: bounds.width, height: 150)
        carouselLayout.sectionInset = .zero

        carouselCollectionView.collectionViewLayout = carouselLayout

        pageControl.numberOfPages = dataSource.count
        pageControl.currentPage = page
    }
}

// MARK: - UICollectionViewDataSource

extension CarouselView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.identifier,
                                                            for: indexPath) as? CarouselCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        guard let image = dataSource[indexPath.row] else {
            return UICollectionViewCell()
        }

        cell.configure(with: image)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CarouselView: UICollectionViewDelegate {}
