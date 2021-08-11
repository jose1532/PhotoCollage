//
//  NetworkConstants.swift
//  PhotoGrid
//
//  Created by Nestor Silva on 10/08/21.
//

import Foundation

enum EndPoints: String {
    case baseURL = "https://dev.consultr.net"
    case getHeroes = "/superhero.json"
}

enum HTTPRequestType: String {

    case GET = "GET"
    case POST = "POST"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
    case PUT = "PUT"
}
