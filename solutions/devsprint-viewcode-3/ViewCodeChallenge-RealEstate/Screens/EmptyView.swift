//
//  EmptyView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Tatiana Rico on 07/12/21.
//

import Foundation
import UIKit


struct EmptyViewConfiguration {
    var titleInformation: String
    var msgInformation: String
}

final class EmptyView: UIView {
    
    private var titleText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont.preferredFont(forTextStyle: .title1)
        lb.textAlignment = .center
        return lb
    }()
    
    private var msgText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont.preferredFont(forTextStyle: .caption1)
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.setupAddView()
        self.setupContrains()
    }
    
    private func setupAddView() {
        self.backgroundColor = .white
        self.addSubview(self.titleText)
        self.addSubview(self.msgText)
    }
    
    private func setupContrains() {
        self.titleText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleText.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.msgText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        self.msgText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 10).isActive = true
    }
    
    public func updateTextView(msg: EmptyViewConfiguration) {
        self.titleText.text = msg.titleInformation
        self.msgText.text = msg.msgInformation
    }
}

