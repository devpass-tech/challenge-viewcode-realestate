//
//  DividerView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 20/10/21.
//

import UIKit

class DividerView: UIView {
  // MARK: Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
    configureConstraits()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private

  private func configureConstraits() {
    NSLayoutConstraint.activate([
      widthAnchor.constraint(equalToConstant: frame.width),
      heightAnchor.constraint(equalToConstant: 1),
    ])
  }

  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    accessibilityIdentifier = "divider-view"
    backgroundColor = .lightGray
  }
}
