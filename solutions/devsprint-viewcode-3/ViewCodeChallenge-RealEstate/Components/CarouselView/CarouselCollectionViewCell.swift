//
//  CarouselCollectionViewCell.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 06/12/21.
//

import UIKit

struct CarouselCollectionViewCellConfiguration {
    let image: UIImage
}

class CarouselCollectionViewCell: UICollectionViewCell {
    static let identifier = "CarouselId"
    var cellConfiguration: CarouselCollectionViewCellConfiguration?

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.accessibilityIdentifier = "image-View"
        return view
    }()

    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with cellConfiguration: CarouselCollectionViewCellConfiguration) {
        self.cellConfiguration = cellConfiguration
        imageView.image = cellConfiguration.image
    }
}

// MARK: - ViewCode

extension CarouselCollectionViewCell: ViewCode {
    func configureSubviews() {
        addSubview(imageView)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func configureAdditionalBehaviors() {}
}
