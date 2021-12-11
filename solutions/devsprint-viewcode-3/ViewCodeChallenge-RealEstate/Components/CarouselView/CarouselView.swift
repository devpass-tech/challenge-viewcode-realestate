//
//  CarouselView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 06/12/21.
//

import UIKit

struct CarouselViewConfiguration {
    let images: [UIImage]
    let page: Int
}

class CarouselView: UIView {
    private var viewConfiguration: CarouselViewConfiguration?

    private lazy var carouselCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.identifier)
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.dataSource = self
        view.delegate = self
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

    // MARK: Lifecycle

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Internal

    func configure(with viewConfiguration: CarouselViewConfiguration) {
        self.viewConfiguration = viewConfiguration
    }
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

        guard let viewConfiguration = viewConfiguration else { return }
        pageControl.numberOfPages = viewConfiguration.images.count
        pageControl.currentPage = viewConfiguration.page
    }
}

// MARK: - UICollectionViewDataSource

extension CarouselView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewConfiguration?.images.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let viewConfiguration = viewConfiguration,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.identifier,
                                                            for: indexPath) as? CarouselCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        let image = viewConfiguration.images[indexPath.row]
        
        let cellConfiguration = CarouselCollectionViewCellConfiguration(image: image)
        cell.configure(with: cellConfiguration)

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CarouselView: UICollectionViewDelegate {}
