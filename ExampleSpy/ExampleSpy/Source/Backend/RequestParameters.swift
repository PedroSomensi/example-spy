//
//  RequestParameters.swift
//  ExampleSpy
//
//  Created by Pedro Somensi on 13/02/24.
//

import Foundation

struct RequestParameters {
    
    var method: HTTPMethod
    var endpoint: String
    var queryParams: [String: String]?
    var body: [String: Any]?
    
    init(
        method: HTTPMethod,
        endPoint: String,
        queryParams: [String: String]? = nil,
        body: [String : Any]? = nil
    ) {
        self.method = method
        self.endpoint = endPoint
        self.queryParams = queryParams
        self.body = body
    }
    
}
