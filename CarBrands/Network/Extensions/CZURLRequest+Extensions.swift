//
//  CZURLRequest+Extensions.swift
//  CarBrands
//
//  Created by Venkata Sama on 09/10/21.
//

import Foundation

extension URLRequest {
    
    /// Creates URLRequest
    /// - Parameter request: CZNetworkRequest
    init(request: RequestProtocol) {
        if let url =  request.fullResourceURL {
            self.init(url: url)
            self.httpMethod = request.httpMethod?.rawValue
            
            if let contentType = request.requestContentType?.contentType {
                self.setValue(contentType, forHTTPHeaderField: "Content-Type")
            }
            
            if let body = request.body {
                self.httpBody = body
            }
        }
        else {
            fatalError("Could not create the request URL")
        }
    }
}
