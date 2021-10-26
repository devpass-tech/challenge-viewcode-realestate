//
//  CustomTextField.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Bruna Fernanda Drago on 25/10/21.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius          = 10
        layer.borderWidth           = 2
        layer.borderColor           = UIColor.systemGray4.cgColor
        
        textColor                   = .label
        tintColor                   = .label
        textAlignment               = .left
        font                        = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 10
        
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no
        clearButtonMode             = .whileEditing
    }
}
