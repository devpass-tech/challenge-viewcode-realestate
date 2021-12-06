//
//  PropertyViewCell.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Dairan on 21/10/21.
//

import UIKit

class PropertyViewCell: UITableViewCell {
  // MARK: Lifecycle

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureSubviews()
    configureConstraits()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  static let cellIdentifier = "PropertyViewCell"

  func configure(_ property: Property) {
    price.text = property.pricingInfos.price
    condo.text = property.pricingInfos.monthlyCondoFee
    iptu.text = property.pricingInfos.yearlyIptu
    let propertyImage = UIImage(named: property.images.first!)
    propertyImagesView.image = propertyImage
  }

  // MARK: Private

  private var descriptionStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.spacing = 8
    return stackView
  }()

  private var propertyImagesView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()

  private var price: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private var condo: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = true
    return label
  }()

  private var iptu: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = true
    return label
  }()

  private func configureSubviews() {
    descriptionStackView.addArrangedSubview(propertyImagesView)
    descriptionStackView.addArrangedSubview(price)
    descriptionStackView.addArrangedSubview(condo)
    descriptionStackView.addArrangedSubview(iptu)
    contentView.addSubview(descriptionStackView)
  }

  private func configureConstraits() {
    NSLayoutConstraint.activate([
      descriptionStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
      descriptionStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      descriptionStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      descriptionStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

      propertyImagesView.heightAnchor.constraint(equalToConstant: 120),
      propertyImagesView.topAnchor.constraint(equalTo: contentView.topAnchor),
    ])
  }
}
