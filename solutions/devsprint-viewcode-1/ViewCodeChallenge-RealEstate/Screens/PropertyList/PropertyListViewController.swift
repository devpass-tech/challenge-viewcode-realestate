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

  override func viewDidLoad() {
    super.viewDidLoad()

    configure()
    configureSubviews()
    configureConstraits()
    bind()
  }

  // MARK: Private

  private let apiClient = RealEstateAPIClient()

  private lazy var viewModel: PropertyListViewModel = {
    let viewModel = PropertyListViewModel(service: apiClient)
    viewModel.delegate = self
    return viewModel
  }()

  private lazy var listingTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
  }()

  private func configure() {
    self.view.backgroundColor = .white
  }

  private func configureSubviews() {
    view.addSubview(listingTableView)
  }

  private func configureConstraits() {
    NSLayoutConstraint.activate([
      listingTableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
      listingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      listingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      listingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}

// MARK: UITableViewDelegate

extension PropertyListViewController: UITableViewDelegate {
}

// MARK: UITableViewDataSource

extension PropertyListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.numberOfRows
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className, for: indexPath)
    return configureCell(cell, at: indexPath)
  }

  private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
    let property = (viewModel.property(at: indexPath))

    var config = cell.defaultContentConfiguration()
    config.text = property?.address.city
    config.secondaryText = property?.pricingInfos.monthlyCondoFee

    cell.contentConfiguration = config

    return cell
  }

  private func bind() {
  }
}

// MARK: PropertyListViewModelDelegate

extension PropertyListViewController: PropertyListViewModelDelegate {
  func startedLoading() {
    print("++++ iniciu download")
  }

  func stoppedLoading() {
    print("---- finalizou download")
  }

  func updatedListing() {
    listingTableView.reloadData()
    print("recarregad dados")
  }
}
