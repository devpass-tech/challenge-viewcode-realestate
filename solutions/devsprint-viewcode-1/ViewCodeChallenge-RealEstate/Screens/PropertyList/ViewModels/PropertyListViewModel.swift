//
//  PropertyListViewModel.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 21/10/21.
//

import UIKit

// MARK: - PropertyListViewModelDelegate

protocol PropertyListViewModelDelegate: AnyObject {
  func startedLoading()
  func stoppedLoading()
  func updatedListing()
}

// MARK: - PropertyListViewModel

class PropertyListViewModel {
  // MARK: Lifecycle

  init(service: RealEstateAPIClient) {
    self.service = service
    getProperties()
  }

  // MARK: Internal

  weak var delegate: PropertyListViewModelDelegate?

  var numberOfRows: Int {
    properties?.count ?? 0
  }

  func getProperty(at indexPath: IndexPath) -> Property? {
    properties?[indexPath.row]
  }

  func configCell(at cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
    guard let property = getProperty(at: indexPath) else { return UITableViewCell() }

    var config = cell.defaultContentConfiguration()
    config.text = property.address.city
    config.secondaryText = property.pricingInfos.monthlyCondoFee

    cell.contentConfiguration = config
    return cell
  }

  func getProperties() {
    service.fetchProperties { properties in
      self.properties = properties
    }
  }

  // MARK: Private

  private var service: RealEstateAPIClient

  private var properties: [Property]? {
    didSet {
      self.delegate?.updatedListing()
    }
  }
}
