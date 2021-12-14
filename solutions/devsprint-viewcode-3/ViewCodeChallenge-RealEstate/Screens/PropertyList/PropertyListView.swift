//
//  PropertyListView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 13/12/21.
//

import UIKit

struct PropertyViewConfiguration {
    let properties: [Property]
}

class PropertyListView: UIView {

    private var propertyViewConfiguration: PropertyViewConfiguration?

    private lazy var propertyTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PropertyTableViewCell.self, forCellReuseIdentifier: PropertyTableViewCell.cellId)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with config: PropertyViewConfiguration) {
        self.propertyViewConfiguration = config
        propertyTableView.reloadData()
    }
}

// MARK: - ViewCode
extension PropertyListView: ViewCode {
    func configureSubviews() {
        addSubview(propertyTableView)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            propertyTableView.topAnchor.constraint(equalTo: topAnchor),
            propertyTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            propertyTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            propertyTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configureAdditionalBehaviors() {}
}

// MARK: - UITableViewDataSource
extension PropertyListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        propertyViewConfiguration?.properties.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        320
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.cellId, for: indexPath) as? PropertyTableViewCell else { return UITableViewCell() }

        guard let property = propertyViewConfiguration?.properties[indexPath.row] else { return UITableViewCell() }

        let images = property.images.compactMap { UIImage(named: $0) }
        let carouselConfig = CarouselViewConfiguration(images: images)
        let propertyInforConfig = PropertyInfoConfiguration(price: property.pricingInfos.price,
                                                          iptu: property.pricingInfos.yearlyIptu,
                                                          condoFee: property.pricingInfos.monthlyCondoFee,
                                                          usableAreas: property.usableAreas,
                                                          parkingSpaces: property.parkingSpaces,
                                                          bathrooms: property.bathrooms,
                                                          bedrooms: property.bedrooms,
                                                          address: property.address.city)

        let config = PropertyTableViewCellConfiguration(carousel: carouselConfig,
                                                        propertyInfoConfig: propertyInforConfig)
        cell.configure(with: config)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PropertyListView: UITableViewDelegate {}
