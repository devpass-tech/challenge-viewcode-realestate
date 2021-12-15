//
//  TextFieldView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 14/12/21.
//

import UIKit

class TextFieldView: UITextField {
    // MARK: Lifecycle
    init(textInset: UIEdgeInsets = UIEdgeInsets(top: 10,
                                                left: 12,
                                                bottom: 12,
                                                right: 0))
    {
        self.textInset = textInset
        super.init(frame: .zero)
        font = .preferredFont(forTextStyle: .title3)
        layer.borderColor = UIColor.placeholderText.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 6
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Internal
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textInset)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textInset)
    }

    // MARK: Private
    private var textInset: UIEdgeInsets

}
