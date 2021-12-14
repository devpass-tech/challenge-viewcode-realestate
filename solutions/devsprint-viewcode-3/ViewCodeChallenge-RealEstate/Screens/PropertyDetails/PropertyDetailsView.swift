//
//  PropertyDetailsView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Pedro Gabriel on 13/12/21.
//

import UIKit

final class PropertyDetailsView: UIView {
    // MARK: Views
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var carouselView: UIView = {
        let images = [
            UIImage(named: "pic1")!,
            UIImage(named: "pic2")!,
            UIImage(named: "pic3")!
        ]
        
        let view = CarouselView()
        let viewConfiguration = CarouselViewConfiguration(images: images, page: 0)
        view.configure(with: viewConfiguration)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mapView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var propertyInfoView: UIView = {
        let view = PropertyInfoView()
        let configuration = PropertyInfoConfiguration(price: "401.000",
                                                      iptu: "670",
                                                      condoFee: "560",
                                                      usableAreas: 60,
                                                      parkingSpaces: 2,
                                                      bathrooms: 2,
                                                      bedrooms: 2,
                                                      address: "Av. Taylor Swift")
        view.configure(with: configuration)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Extension ViewCode
extension PropertyDetailsView: ViewCode {
    func configureSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(carouselView)
        stackView.addArrangedSubview(propertyInfoView)
        stackView.addArrangedSubview(mapView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            carouselView.heightAnchor.constraint(equalToConstant: 175),
            propertyInfoView.heightAnchor.constraint(equalToConstant: 150),
            mapView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    func configureAdditionalBehaviors() {}
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct PropertyDetailsViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let propertyDetailsView = PropertyDetailsView()
            return propertyDetailsView
        }
    }
}
#endif
