//
//  CarouselCollectionViewCell.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 06/12/21.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSubviews()
        configureSubviewsConstraints()
        configureAdditionalBehaviors()
    }

    convenience init() {
        self.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Internal

    static let identifier = "CarouselId"

    func configure(with image: UIImage) {
        self.imageView.image = image
    }

    // MARK: Private

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemOrange
        view.contentMode = .scaleAspectFill
        view.accessibilityIdentifier = "image-View"
        return view
    }()
}

// MARK: - ViewCode

extension CarouselCollectionViewCell: ViewCode {
    func configureSubviews() {
        addSubview(imageView)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
        ])
    }

    func configureAdditionalBehaviors() {}
}
