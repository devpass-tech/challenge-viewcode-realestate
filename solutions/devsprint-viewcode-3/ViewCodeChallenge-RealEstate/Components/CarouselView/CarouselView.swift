//
//  CarouselView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 06/12/21.
//

import UIKit

struct CarouselViewConfiguration {
    let images: [UIImage]
}

class CarouselView: UIView {
    private var viewConfiguration: CarouselViewConfiguration?

    private lazy var carouselCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        pageControl.backgroundStyle = .automatic
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

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 200)
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
            carouselCollectionView.heightAnchor.constraint(equalToConstant: 200),

            pageControl.bottomAnchor.constraint(equalTo: carouselCollectionView.bottomAnchor),
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
        guard let viewConfiguration = viewConfiguration else { return }
        pageControl.numberOfPages = viewConfiguration.images.count
    }
}

// MARK: - UICollectionViewDataSource

extension CarouselView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewConfiguration?.images.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let viewConfiguration = viewConfiguration,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.identifier, for: indexPath) as? CarouselCollectionViewCell
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

extension CarouselView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CarouselViewPreviews: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let images = [
                UIImage(named: "pic1")!,
                UIImage(named: "pic2")!,
                UIImage(named: "pic3")!,
                UIImage(named: "pic4")!,
                UIImage(named: "pic5")!,
                UIImage(named: "pic6")!,
            ]
            
            let view = CarouselView()
            let viewConfiguration = CarouselViewConfiguration(images: images)
            view.configure(with: viewConfiguration)
            
            return view
        }
        .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 170))
    }
}
#endif
