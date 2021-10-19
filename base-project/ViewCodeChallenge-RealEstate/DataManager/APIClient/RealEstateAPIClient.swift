//
//  APIClient.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//


import Foundation

public protocol RealEstateAPIClientType: HTTPClientType {

    func fetchProperties(completion: @escaping ([Property]) -> ())
}

public final class RealEstateAPIClient: RealEstateAPIClientType {

    public var baseURL: URL {

        return URL(string: "https://trackingbr.dairan.com/v1/codigo/NX409895735BR")!
    }

    public var httpHeaders: [HTTPHeaderField : String] {

        return [HTTPHeaderField.contentType : ContentType.json.rawValue]
    }

    public let networkClient: NetworkClientType

    public init(networkClient: NetworkClientType) {

        self.networkClient = networkClient
    }

    public func fetchProperties(completion: @escaping ([Property]) -> ()) {

        self.networkClient.get(url: self.baseURL, headers: self.httpHeaders) { response in

            DispatchQueue.main.async {

                switch response {

                case .result(let data):

                    completion(self.decodeData(data))
                case .error:

                    completion([])
                }
            }
        }
    }

    private func decodeData(_ data: Data) -> [Property] {

        let jsonDecoder = JSONDecoder()
        do {

            let response = try jsonDecoder.decode([Property].self, from: data)
            return response
        } catch {

            return []
        }
    }
}
