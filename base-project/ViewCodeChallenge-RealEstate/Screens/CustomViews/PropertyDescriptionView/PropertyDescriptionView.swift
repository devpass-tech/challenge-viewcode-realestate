//
//  PropertyDescriptionView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 18/10/21.
//

import UIKit

// MARK: - PropertyDescriptionView

class PropertyDescriptionView: UIView {
  // MARK: Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
    configureViews()
    configureConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.spacing = 12
    return stackView
  }()

  func set(with viewModel: PropertyDescriptionViewViewModel) {
    self.viewModel = viewModel
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    configureButtonMore()
  }

  // MARK: Private

  private var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    let metrics = UIFontMetrics(forTextStyle: .subheadline)
    let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .subheadline)
    let font = UIFont.systemFont(ofSize: desc.pointSize, weight: .bold)
    label.font = metrics.scaledFont(for: font)

    return label
  }()

  private var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 5
    label.lineBreakMode = .byTruncatingTail
    label.font = .preferredFont(forTextStyle: .caption1)

    return label
  }()

  private var buttonDefault: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 8
    button.backgroundColor = .link
    button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)

    return button
  }()

  private var viewModel: PropertyDescriptionViewViewModel? {
    didSet {
      guard let viewModel = viewModel else { return }
      titleLabel.text = viewModel.title
      descriptionLabel.text = viewModel.description
      buttonDefault.setTitle(viewModel.textButton, for: .normal)
    }
  }

  private func configureButtonMore() {
    if descriptionLabel.calculateMaxLines() >= 5 {
      stackView.addArrangedSubview(buttonDefault)
    }
  }

  @objc private func didTappedButton() {
  }

  private func configure() {
    backgroundColor = .systemBackground
  }

  private func configureViews() {
    addSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(descriptionLabel)
  }

  private func configureConstraints() {
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),

      titleLabel.heightAnchor.constraint(equalToConstant: 30),
    ])
  }
}

extension UILabel {
  func calculateMaxLines() -> Int {
    let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
    let charSize = font.lineHeight
    let text = (self.text ?? "") as NSString
    let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font!], context: nil)
    let linesRoundedUp = Int(ceil(textSize.height / charSize))
    return linesRoundedUp
  }
}
