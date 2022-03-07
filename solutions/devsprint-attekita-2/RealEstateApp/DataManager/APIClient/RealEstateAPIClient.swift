//
//  APIClient.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//


import Foundation

public final class RealEstateAPIClient {

    public func fetchProperties(completion: @escaping ([Property]) -> ()) {

        guard let path = Bundle.main.path(forResource: "listings", ofType: "json") else {

            completion([])
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

            completion(decodeData(data))

        } catch {

            completion([])
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
