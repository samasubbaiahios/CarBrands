//
//  APIHandler.swift
//  CarBrands
//
//  Created by Venkata Sama on 09/10/21.
//

import Foundation

enum NetworkErrorTypes:Error {
    case APIError
    case URLRequestFailed
    case ResponseError
    case Unknown
    case noInternetConnection
}

protocol RequestHandler {
    func makeRequest(_ request: RequestProtocol) -> URLRequest?
}


protocol ResponseHandler {
    associatedtype ResponseDataType
    func parseResponse(_ data: Data, _ response: HTTPURLResponse?) throws -> ResponseDataType
}

typealias APIHandler = RequestHandler & ResponseHandler
