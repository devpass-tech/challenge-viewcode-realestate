//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

// MARK: - PropertyListViewController

class PropertyListViewController: UIViewController {
  // MARK: Internal

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let apiClient = RealEstateAPIClient()
    let viewModel = PropertyListViewModel(service: apiClient)
    viewModel.getProperties()
    propertyListView.set(viewModel: viewModel)
  }

  override func loadView() {
    super.loadView()
    view = propertyListView
  }

  // MARK: Private

  private var propertyListView = PropertyListView()
}
