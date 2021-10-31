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
  }

  // MARK: Private

  private let apiClient = RealEstateAPIClient()
  private var properties: [Property] = []

  private lazy var viewModel: PropertyListViewModel = {
    let vm = PropertyListViewModel(servico: apiClient)
    return vm
  }()

  private lazy var listingTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(PropertyViewCell.self, forCellReuseIdentifier: PropertyViewCell.cellIdentifier)
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
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyViewCell.cellIdentifier,
                                                   for: indexPath) as? PropertyViewCell else { fatalError() }

    let property = (viewModel.property(at: indexPath))!
    cell.configure(property)

    return cell
  }
}
