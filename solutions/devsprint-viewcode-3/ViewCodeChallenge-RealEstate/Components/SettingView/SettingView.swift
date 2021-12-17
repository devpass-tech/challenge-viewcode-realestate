//
//  SettingView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Tatiana Rico on 15/12/21.
//

import Foundation
import UIKit

class SettingView: UIView {
   private var listTableView: UITableView = {
        let tb = UITableView.init(frame: .zero, style: .grouped)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(SettingTableViewCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingView: ViewCode {
    func configureSubviews() {
        self.addSubview(listTableView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: self.topAnchor),
            listTableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            listTableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            listTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
        listTableView.dataSource = self
        listTableView.delegate = self
    }
}

extension SettingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return  "APP VERSION"
    }
}

extension SettingView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        
        cell.textLabel?.text = "Version 1.0"
        
        return cell
    }
}
