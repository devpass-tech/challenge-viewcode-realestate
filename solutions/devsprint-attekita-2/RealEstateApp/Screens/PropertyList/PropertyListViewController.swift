//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class PropertyListViewController: UIViewController {
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func loadView() {
        let emptyView = EmptyView()
        emptyView.updateView(with: EmptyViewConfiguration(
            title: "No listings found!",
            subtitle: "Search for cities and neighborhoods using the search bar above"))
        
        view = emptyView
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupUI()
        fetchService()
    }
    
    private func fetchService() {
        let apiClient = RealEstateAPIClient()

        apiClient.fetchProperties { properties in
            print(properties)
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Real Estate App 🏡"
    }
}

