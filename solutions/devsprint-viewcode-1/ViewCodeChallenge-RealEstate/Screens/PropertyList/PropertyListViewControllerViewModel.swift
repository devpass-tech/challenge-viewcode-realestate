//
//  PropertyListViewControllerViewModel.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 21/10/21.
//

import Foundation

class PropertyListViewControllerViewModel {
  // MARK: Lifecycle

  init(_ property: Property) {
    self.property = property
  }

  // MARK: Private

  private let property: Property

  var images: [String] {
    property.images
  }
  var price: String {
    property.pricingInfos.price

  }
  var monthlyCondoFee: String {
    property.pricingInfos.monthlyCondoFee ?? "--"

  }
  var yearlyIptu: String {
    property.pricingInfos.yearlyIptu ?? "--"
  }
}
