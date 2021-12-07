//
//  EmptyView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Tatiana Rico on 07/12/21.
//

import Foundation
import UIKit


final class EmptyView: UIView {
    
    private var titleText: UILabel {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont.preferredFont(forTextStyle: .title1)
        lb.textAlignment = .center
        return lb
    }
    
    private var msgText: UILabel {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont.preferredFont(forTextStyle: .caption1)
        lb.textAlignment = .center
        return lb
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
        updateTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.setupAddView()
        self.setupContrains()
    }
    
    private func setupAddView() {
        self.backgroundColor = .blue
        self.addSubview(self.titleText)
        self.addSubview(self.msgText)
    }
    
    private func setupContrains() {
        self.titleText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleText.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.msgText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        self.msgText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 10).isActive = true
    }
    
    public func updateTextView() {
        self.titleText.text = "No listings found"
        self.msgText.text = "Search for cities and neighborhoods using the seacr bar above"
    }
}

