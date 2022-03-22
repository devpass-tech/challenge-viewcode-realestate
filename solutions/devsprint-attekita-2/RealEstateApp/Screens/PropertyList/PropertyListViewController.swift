//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class PropertyListViewController: UITableViewController {
    // MARK: - Properties
    var properties: [Property]? = nil {
        didSet {
            properties != nil ? setPropertiesView() : setEmptyView()
        }
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupUI()
        fetchService()
    }
    
    private func setEmptyView() {
        let emptyView = EmptyView()
        emptyView.updateView(with: EmptyViewConfiguration(
            title: "No listings found!",
            subtitle: "Search for cities and neighborhoods using the search bar above"))
        
        tableView.backgroundView = emptyView
    }
    
    private func setPropertiesView() {
        tableView.backgroundView = nil
        
        // TODO: Implementar aqui a funcionalidade de exibição de dados na tela
    }
    
    private func fetchService() {
        let apiClient = RealEstateAPIClient()

        apiClient.fetchProperties { [weak self] properties in
            self?.properties = properties
            print(properties)
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Real Estate App 🏡"
    }
}

