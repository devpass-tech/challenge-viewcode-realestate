//
//  PropertyDetailsView.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Pedro Gabriel on 13/12/21.
//

import UIKit

struct PropertyDetailsViewConfiguration {
    let carouselViewConfiguration: CarouselViewConfiguration
    let propertyInfoViewConfiguration: PropertyInfoConfiguration
    let mapViewConfiguration: MapLocationViewModel
    let descriptionViewConfiguration: PropertyDescriptionViewConfiguration
}

protocol PropertyDetailsViewDelegate: AnyObject {
    func didTapMapView()
}

final class PropertyDetailsView: UIView {

    weak var delegate: PropertyDetailsViewDelegate?

    // MARK: Views
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var carouselView: CarouselView = {
        let view = CarouselView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var propertyInfoView: PropertyInfoView = {
        let view = PropertyInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mapView: MapLocationView = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapMapView))
        let view = MapLocationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(tap)
        return view
    }()
    
    private lazy var propertyDescriptionView: PropertyDescriptionView = {
        let view = PropertyDescriptionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contactFormView: ContactFormView = {
        let view = ContactFormView()
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
    
    // MARK: Methods
    func configure(with configuration: PropertyDetailsViewConfiguration) {
        carouselView.configure(with: configuration.carouselViewConfiguration)
        propertyInfoView.configure(with: configuration.propertyInfoViewConfiguration)
        mapView.configure(with: configuration.mapViewConfiguration)
        propertyDescriptionView.configure(with: configuration.descriptionViewConfiguration)
    }

    @objc
    private func didTapMapView() {
        delegate?.didTapMapView()
    }
}

// MARK: Extension ViewCode
extension PropertyDetailsView: ViewCode {
    func configureSubviews() {
        addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(carouselView)
        stackView.addArrangedSubview(propertyInfoView)
        stackView.addArrangedSubview(mapView)
        stackView.addArrangedSubview(propertyDescriptionView)
        stackView.addArrangedSubview(contactFormView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            propertyInfoView.heightAnchor.constraint(equalToConstant: 150),
            mapView.heightAnchor.constraint(equalToConstant: 170),
            propertyDescriptionView.heightAnchor.constraint(equalToConstant: 200),
            contactFormView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//
//struct PropertyDetailsViewPreview: PreviewProvider {
//    static var previews: some View {
//        UIViewPreview {
//            let carouselConfiguration: CarouselViewConfiguration = .init(images: [.init(named: "pic1")!,
//                                                                                  .init(named: "pic2")!,
//                                                                                  .init(named: "pic3")!])
//            
//            let propertyInfoConfiguration: PropertyInfoConfiguration = .init(price: "401.000",
//                                                                             iptu: "670",
//                                                                             condoFee: "560",
//                                                                             usableAreas: 60,
//                                                                             parkingSpaces: 2,
//                                                                             bathrooms: 2,
//                                                                             bedrooms: 2,
//                                                                             address: "Av. Taylor Swift")
//            
//            let mapConfiguration: MapLocationViewModel = .init(title: "Lorem ipsum", lat: -31.765696, lng: -52.315801)
//            
//            let descriptionConfiguration: PropertyDescriptionViewConfiguration = .init(description: "Lorem Ipsum")
//            
//            let configuration: PropertyDetailsViewConfiguration = .init(carouselViewConfiguration: carouselConfiguration,
//                                                                        propertyInfoViewConfiguration: propertyInfoConfiguration,
//                                                                        mapViewConfiguration: mapConfiguration,
//                                                                        descriptionViewConfiguration: descriptionConfiguration)
//            
//            let propertyDetailsView = PropertyDetailsView()
//            propertyDetailsView.configure(with: configuration)
//            return propertyDetailsView
//        }
//    }
//}
//#endif
