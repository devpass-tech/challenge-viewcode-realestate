//
//  PropertyListViewModel.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 21/10/21.
//

import Foundation

class PropertyListViewModel {
  // MARK: Lifecycle

//  init?(properties: [Property]) {
//    self.properties = properties
//  }

  init(servico: RealEstateAPIClient) {
    self.servico = servico
    servico.fetchProperties { properties in
      self.properties = properties
    }
  }

  // MARK: Internal

  var numberOfRows: Int {
    properties?.count ?? 0
  }

  func property(at indexPath: IndexPath) -> Property? {
    properties?[indexPath.row] ?? nil
  }

  // MARK: Private

  private var properties: [Property]?
  private let servico: RealEstateAPIClient
}
