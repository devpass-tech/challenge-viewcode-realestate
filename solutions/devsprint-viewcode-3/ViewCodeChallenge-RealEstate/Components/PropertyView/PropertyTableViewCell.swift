    //
    //  PropertyTableViewCell.swift
    //  ViewCodeChallenge-RealEstate
    //
    //  Created by Dairan on 10/12/21.
    //

import UIKit

struct PropertyTableViewCellConfigure {
    let carousel: CarouselViewConfiguration
    let propertyInfoConfig: PropertyInfoConfiguration
}

class PropertyTableViewCell: UITableViewCell {

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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "carousel-View"
        return view
    }()

    private var propertyInfoView : PropertyInfoView = {
        let view = PropertyInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "property-Info-View"
        return view
    }()

    private var dividerView: DividerView = {
        let view = DividerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "divider-View"
        return view
    }()

    private var cellConfigure: PropertyTableViewCellConfigure?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with config: PropertyTableViewCellConfigure) {
        self.cellConfigure = config

        guard let cellConfigure = cellConfigure else  { return }
        carouselView.configure(with: cellConfigure.carousel)
        propertyInfoView.configure(with: cellConfigure.propertyInfoConfig)
    }
}

extension PropertyTableViewCell: ViewCode {
    func configureSubviews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(carouselView)
        stackView.addArrangedSubview(propertyInfoView)
        stackView.addArrangedSubview(dividerView)
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
    }
}
