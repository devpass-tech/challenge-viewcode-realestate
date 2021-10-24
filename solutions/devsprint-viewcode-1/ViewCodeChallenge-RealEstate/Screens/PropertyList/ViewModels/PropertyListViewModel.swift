//
//  PropertyListViewModel.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 21/10/21.
//
import Foundation

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

    service.fetchProperties { properties in
      DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
        self.delegate?.startedLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
          self.properties = properties
          self.delegate?.stoppedLoading()
          self.delegate?.updatedListing()
        }
      }
    }
  }

  // MARK: Internal

  weak var delegate: PropertyListViewModelDelegate?

  var numberOfRows: Int {
    properties?.count ?? 0
  }

  func property(at indexPath: IndexPath) -> Property? {
    properties?[indexPath.row] ?? nil
  }

  // MARK: Private

  private let service: RealEstateAPIClient
  private var properties: [Property]?
}
