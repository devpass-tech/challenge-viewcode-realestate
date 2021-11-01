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

  init(with viewModel: PropertyDescriptionViewViewModel) {
    self.viewModel = viewModel
    super.init(frame: .zero)

    configure()
    configureViews()
    configureConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  override func layoutSubviews() {
    super.layoutSubviews()

    configureButtonMore()
  }

  // MARK: Private

  private var containerStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.spacing = 12
    stackView.accessibilityIdentifier = "container-Stack-View"
    return stackView
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    let metrics = UIFontMetrics(forTextStyle: .subheadline)
    let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .subheadline)
    let font = UIFont.systemFont(ofSize: desc.pointSize, weight: .bold)
    label.font = metrics.scaledFont(for: font)
    label.text = viewModel.title
    label.accessibilityIdentifier = "title-Label"
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 5
    label.lineBreakMode = .byTruncatingTail
    label.font = .preferredFont(forTextStyle: .caption1)
    label.text = viewModel.description
    label.accessibilityIdentifier = "description-Label"
    return label
  }()

  private lazy var buttonDefault: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 8
    button.backgroundColor = .link
    button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
    button.setTitle(viewModel.textButton, for: .normal)
    button.accessibilityIdentifier = "button-Default"
    return button
  }()

  private var viewModel: PropertyDescriptionViewViewModel

  private func configureButtonMore() {
    let lines = calculateNumberOfLines(for: descriptionLabel, in: descriptionLabel.frame)

    if lines >= 5 {
      containerStackView.addArrangedSubview(buttonDefault)
      layoutIfNeeded()
    }
  }

  @objc private func didTappedButton() {
  }

  private func configure() {
    accessibilityIdentifier = "property-Description-View"
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .systemBackground
  }

  private func configureViews() {
    addSubview(containerStackView)
    containerStackView.addArrangedSubview(titleLabel)
    containerStackView.addArrangedSubview(descriptionLabel)
  }

  private func configureConstraints() {
    NSLayoutConstraint.activate([
      widthAnchor.constraint(equalToConstant: 400),

      containerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      containerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      containerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      containerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),

    ])
  }

  private func calculateNumberOfLines(for label: UILabel, in frame: CGRect) -> Int {
    let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
    let charSize = label.font.lineHeight
    let text = (label.text ?? "") as NSString
    let textSize = text.boundingRect(with: maxSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font: label.font!],
                                     context: nil)
    let linesRoundedUp = Int(ceil(textSize.height / charSize))
    return linesRoundedUp
  }
}
