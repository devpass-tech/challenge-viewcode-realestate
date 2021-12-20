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

protocol PropertyListViewDelegate: AnyObject {
    func didTapCell(_ property: Property)
}

class PropertyListView: UIView {

    weak var delegate: PropertyListViewDelegate?

    private var propertyViewConfiguration: PropertyViewConfiguration?

    private lazy var emptyView: EmptyView = {
        let config = EmptyViewConfiguration(titleInformation: "No listings found",
                                            msgInformation: "Search for cities and neighborhoods using the search bar above")
        let view = EmptyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(with: config)
        return view
    }()
    
    private lazy var loadingView: LoadingView = {
        let loadingViewConfigure = LoadingViewConfiguration(labelText: "Searching for listings")
        let loadingView = LoadingView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.configure(with: loadingViewConfigure)
        return loadingView
    }()

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

    func showEmptyView() {
        UIView.animate(withDuration: 0.75) {
            self.propertyTableView.alpha = 0
        }
    }

    func hideEmptyView() {
        UIView.animate(withDuration: 0.25) {
            self.propertyTableView.alpha = 1
        }
    }
    
    func showLoading() {
        UIView.animate(withDuration: 0.25) {
            self.propertyTableView.alpha = 0
            self.loadingView.isHidden = false
        }
    }
    
    func hideLoading() {
        UIView.animate(withDuration: 0.25) {
            self.propertyTableView.alpha = 1
            self.loadingView.isHidden = true
        }
    }
}

// MARK: - ViewCode
extension PropertyListView: ViewCode {
    func configureSubviews() {
        addSubview(emptyView)
        addSubview(loadingView)
        addSubview(propertyTableView)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            propertyTableView.topAnchor.constraint(equalTo: topAnchor),
            propertyTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            propertyTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            propertyTableView.bottomAnchor.constraint(equalTo: bottomAnchor),

            emptyView.topAnchor.constraint(equalTo: topAnchor),
            emptyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            loadingView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func configureAdditionalBehaviors() {}
}

// MARK: - UITableViewDataSource
extension PropertyListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        propertyViewConfiguration?.properties.count ?? 0
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
extension PropertyListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let property = propertyViewConfiguration?.properties[indexPath.row] else { return }
        delegate?.didTapCell(property)
    }
}
