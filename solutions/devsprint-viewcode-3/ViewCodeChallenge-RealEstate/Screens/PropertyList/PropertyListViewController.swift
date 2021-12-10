//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyListViewController: UIViewController {

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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        let apiClient = RealEstateAPIClient()

        apiClient.fetchProperties { properties in

            print(properties)
        }
    }
}

extension PropertyListViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {

    func updateSearchResults(for searchController: UISearchController) {

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

    }
}
