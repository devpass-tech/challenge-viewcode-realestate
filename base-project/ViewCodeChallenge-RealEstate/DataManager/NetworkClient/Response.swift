//
//  Response.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//


import Foundation

public enum Response {

    case result(Data)
    case error(Error?)
}
