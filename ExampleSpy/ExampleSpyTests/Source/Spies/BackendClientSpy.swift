//
//  BackendClientSpy.swift
//  ExampleSpyTests
//
//  Created by Pedro Somensi on 13/02/24.
//

import Foundation
@testable import ExampleSpy

final class BackendClientSpy: BackendClientProtocol {
    
    var parametersCaptured: RequestParameters?

    func request(parameters: RequestParameters) async throws -> Data {
        parametersCaptured = parameters
        return Data()
    }
    
}
