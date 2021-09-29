//
//  NetworkClient.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//


import Foundation

public protocol NetworkClientType: AnyObject {

    func get(url: URL, headers: [HTTPHeaderField : String], completion: @escaping (Response) -> ())
    func performRequest(httpMethod: HTTPMethod, url: URL, headers: [HTTPHeaderField : String], completion: @escaping (Response) -> ())
}

public final class NetworkClient: NetworkClientType {

    public func get(url: URL, headers: [HTTPHeaderField : String], completion: @escaping (Response) -> ()) {

        self.performRequest(httpMethod: .get, url: url, headers: headers, completion: completion)
    }

    public func performRequest(httpMethod: HTTPMethod, url: URL, headers: [HTTPHeaderField : String], completion: @escaping (Response) -> ()) {

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue

        headers.forEach { headerField, value in

            request.addValue(headerField.rawValue, forHTTPHeaderField: value)
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error {

                completion(.error(error))
                return
            }

            guard let data = data else {

                completion(.error(nil))
                return
            }

            completion(.result(data))
        }
        task.resume()
    }

}
