//
//  SettingView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Tatiana Rico on 15/12/21.
//

import Foundation
import UIKit

class SettingView: UIView {
    
    let textApp: UILabel = {
        let lb = UILabel()
        lb.text = "APP VERSION"
        lb.textAlignment = .left
        lb.font = .preferredFont(forTextStyle: .caption1, compatibleWith: .none)
        return lb
    }()
    
    var listTableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(SettingTableViewCell.self, forCellReuseIdentifier: "cell")
        tb.backgroundColor = .lightGray
        return tb
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        listTableView.dataSource = self
        listTableView.delegate = self
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(listTableView)
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            listTableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            listTableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            listTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}

extension SettingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        return self.textApp.text
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
