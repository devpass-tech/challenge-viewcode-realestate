//
//  HTTPClient.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//


import Foundation

public protocol HTTPClientType: AnyObject {

    var baseURL: URL { get }
    var httpHeaders: [HTTPHeaderField : String] { get }
    var networkClient: NetworkClientType { get }
}
