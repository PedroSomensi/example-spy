//
//  BackendClient.swift
//  ExampleSpy
//
//  Created by Pedro Somensi on 13/02/24.
//

import Foundation

typealias HttpResult = (Result<Data?, Error>) -> Void

protocol BackendClientProtocol {
    func request(parameters: RequestParameters) async throws -> Data
}

enum APIError: LocalizedError {
    case invalidURL
    case offline
}

final class BackendClient: BackendClientProtocol {
    
    private func makeURLRequest(with params: RequestParameters) -> URLRequest? {
        guard let url = URL(string: params.endpoint) else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = params.method.rawValue
        
        return urlRequest
    }
        
    func request(parameters: RequestParameters) async throws -> Data {
        
        guard let urlRequest = makeURLRequest(with: parameters) else {
            throw APIError.invalidURL
        }
        
        do {
            let data = try await URLSession.shared.data(for: urlRequest).0
            return data
        } catch {
            throw error
        }
        
    }
    
}
