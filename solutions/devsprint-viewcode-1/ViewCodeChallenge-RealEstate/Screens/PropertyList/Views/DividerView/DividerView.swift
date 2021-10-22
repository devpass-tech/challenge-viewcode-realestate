//
//  DividerView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 20/10/21.
//

import UIKit

class DividerView: UIView {
  // MARK: Lifecycle

  init() {
    super.init(frame: .zero)
    configure()
    configureConstraits()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private

  private var dividerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.accessibilityIdentifier = "divider-view"
    view.backgroundColor = .lightGray
    return view
  }()

  private func configure() {
    addSubview(dividerView)
  }

  private func configureConstraits() {
    NSLayoutConstraint.activate([
      dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      dividerView.centerYAnchor.constraint(equalTo: centerYAnchor),
      dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      dividerView.heightAnchor.constraint(equalToConstant: 1),
    ])
  }
}
