    //
    //  PropertyTableViewCell.swift
    //  ViewCodeChallenge-RealEstate
    //
    //  Created by Dairan on 10/12/21.
    //

import UIKit

struct PropertyTableViewCellConfiguration {
    let carousel: CarouselViewConfiguration
    let propertyInfoConfig: PropertyInfoConfiguration
}

class PropertyTableViewCell: UITableViewCell {
    static let cellId = "PropertyTableViewCell"

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.accessibilityIdentifier = "stack-View"
        return stackView
    }()

    private var carouselView: CarouselView = {
        let view = CarouselView()
        view.accessibilityIdentifier = "carousel-View"
        return view
    }()

    private var propertyInfoView : PropertyInfoView = {
        let view = PropertyInfoView()
        view.accessibilityIdentifier = "propertyInfoView"
        return view
    }()

    private var dividerView: DividerView = {
        let view = DividerView()
        view.accessibilityIdentifier = "divider-View"
        return view
    }()

    private var cellConfigure: PropertyTableViewCellConfiguration?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with config: PropertyTableViewCellConfiguration) {
        self.cellConfigure = config

        guard let cellConfigure = cellConfigure else  { return }
        carouselView.configure(with: cellConfigure.carousel)
        propertyInfoView.configure(with: cellConfigure.propertyInfoConfig)
    }
}

extension PropertyTableViewCell: ViewCode {
    func configureSubviews() {
        stackView.addArrangedSubview(carouselView)
        stackView.addArrangedSubview(propertyInfoView)
        stackView.addArrangedSubview(dividerView)
        contentView.addSubview(stackView)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    func configureAdditionalBehaviors() {
        backgroundColor = .white
        contentView.isUserInteractionEnabled = false
    }
}
