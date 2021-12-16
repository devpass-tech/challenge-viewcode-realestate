//
//  Property.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import Foundation

public struct Property: Codable {

    var id: String
    var description: String
    var listingStatus: String
    var createdAt: String
    var updatedAt: String
    var listingType: String
    var usableAreas: Int
    var parkingSpaces: Int?
    var bathrooms: Int
    var bedrooms: Int
    var images: [String]
    var owner: Bool
    var pricingInfos: PricingInfos
    var address: Address
}

public struct Address: Codable {

    var city: String
    var neighborhood: String
    var geoLocation: GeoLocation
}

public struct GeoLocation: Codable {

    var precision: String
    var location: Location
}

public struct Location: Codable {

    var lon: Double
    var lat: Double
}

public enum BusinessType: String, Codable {

    case rental = "RENTAL"
    case sale = "SALE"
}

public enum Period: String, Codable {

    case monthly = "MONTHLY"
}

public struct PricingInfos: Codable {

    var period: Period?
    var yearlyIptu: String?
    var price: String
    var rentalTotalPrice: String?
    var businessType: BusinessType
    var monthlyCondoFee: String?
}

func makePropertyMock() -> Property {
    let property: Property = .init(id: "1",
                                   description: "abc",
                                   listingStatus: "123",
                                   createdAt: "123",
                                   updatedAt: "123",
                                   listingType: "123",
                                   usableAreas: 2,
                                   parkingSpaces: 2,
                                   bathrooms: 3,
                                   bedrooms: 4,
                                   images: ["pic1", "pic2", "pic3"],
                                   owner: false,
                                   pricingInfos: .init(period: .monthly,
                                                       yearlyIptu: "670",
                                                       price: "400.000",
                                                       rentalTotalPrice: nil,
                                                       businessType: .rental,
                                                       monthlyCondoFee: nil),
                                   address: .init(city: "",
                                                  neighborhood: "",
                                                  geoLocation: .init(precision: "",
                                                                     location: .init(lon: 12, lat: 12))))
    return property
}
