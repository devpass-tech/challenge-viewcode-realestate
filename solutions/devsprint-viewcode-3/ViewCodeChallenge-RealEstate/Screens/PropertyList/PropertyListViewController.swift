//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyListViewController: UIViewController {

    private let apiClient = RealEstateAPIClient()

    private lazy var propertyListView: PropertyListView = {
        let view = PropertyListView()
        view.delegate = self
        return view
    }()

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Type a city or neighborhood"
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        title = "Real Estate App"
    }

    override func loadView() {
        super.loadView()
        view = propertyListView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        getData()
    }

    private func getData(completionHandler: @escaping () -> Void = {} ) {
        apiClient.fetchProperties { properties in
            let propertyViewConfig = PropertyViewConfiguration(properties: properties)
            self.propertyListView.configure(with: propertyViewConfig)
            completionHandler()
        }
    }
}

extension PropertyListViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {

    func updateSearchResults(for searchController: UISearchController) {
        let textTyped = searchController.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        guard let text = textTyped, text.count != 0 else {
            propertyListView.hideEmptyView()
            return
        }

        guard text.localizedCaseInsensitiveCompare("empty") == .orderedSame else {
            propertyListView.hideEmptyView()
            return
        }

        propertyListView.showEmptyView()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        propertyListView.showLoading()
        getData {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.propertyListView.hideLoading()
            }
        }
    }
}

extension PropertyListViewController: PropertyListViewDelegate {
    func didTapCell(_ property: Property) {
        let viewController = PropertyDetailsViewController(property: property)
        show(viewController, sender: self)
    }
}
