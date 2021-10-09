//
//  CZResponseHandler+Extensions.swift
//  CarBrands
//
//  Created by Venkata Sama on 09/10/21.
//

import Foundation

extension ResponseHandler {
    
    /// Decodes the response data to required entity object
    /// - Parameters:
    ///   - responseData: JSON Data
    ///   - response: HTTPURLResponse
    /// - Throws: APIError or ResponseError
    /// - Returns: Decoded object
    func defaultResponseParser<T:Codable>(_ responseData: Data?, _ response: HTTPURLResponse?) throws -> T {
        if response?.statusCode == 401 {
            throw NetworkErrorTypes.ResponseError
        }
        else {
            guard let data = responseData, let statusCode = response?.statusCode, 200...299 ~= statusCode else {
                throw NetworkErrorTypes.APIError
            }
            
            let jsonDecoder = JSONDecoder()
            return try jsonDecoder.decode(T.self, from: data)
        }
    }
}

