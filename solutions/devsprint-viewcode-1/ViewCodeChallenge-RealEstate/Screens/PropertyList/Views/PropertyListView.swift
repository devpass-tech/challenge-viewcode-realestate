//
//  PropertyListView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 27/10/21.
//

import UIKit

// MARK: - PropertyListView

class PropertyListView: UIView {
  // MARK: Lifecycle

  init() {
    super.init(frame: .zero)
    configure()
    configureSubviews()
    configureConstraits()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  func set(viewModel: PropertyListViewModel) {
    self.viewModel = viewModel
    viewModel.delegate = self
  }

  // MARK: Private

  private var viewModel: PropertyListViewModel?

  private lazy var listingTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: UITableViewCell.className)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
    tableView.accessibilityIdentifier = "listing-TableView"
    return tableView
  }()

  private func configure() {
    backgroundColor = .white
  }

  private func configureSubviews() {
    addSubview(listingTableView)
  }

  private func configureConstraits() {
    NSLayoutConstraint.activate([
      listingTableView.topAnchor.constraint(equalTo: topAnchor),
      listingTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      listingTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      listingTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
}

// MARK: - PropertyListView

extension PropertyListView: UITableViewDelegate {
}

// MARK: - PropertyListView

extension PropertyListView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel?.numberOfRows ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className, for: indexPath)
    guard let viewModel = viewModel else { return UITableViewCell() }
    return viewModel.configCell(at: cell, at: indexPath)
  }
}

// MARK: - PropertyListView

extension PropertyListView: PropertyListViewModelDelegate {
  func startedLoading() {
    
  }

  func stoppedLoading() {

  }

  func updatedListing() {
    listingTableView.reloadData()
  }
}
