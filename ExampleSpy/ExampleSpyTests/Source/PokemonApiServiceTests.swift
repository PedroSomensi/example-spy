//
//  PokemonApiServiceTests.swift
//  ExampleSpyTests
//
//  Created by Pedro Somensi on 13/02/24.
//

import XCTest
@testable import ExampleSpy

final class PokemonApiServiceTests: XCTestCase {
    
    private var spy: BackendClientSpy!
    private var sut: PokemonApiService!
    
    override func setUp() {
        super.setUp()
        spy = BackendClientSpy()
        sut = PokemonApiService(client: spy)
    }
    
    override func tearDown() {
        super.tearDown()
        spy = nil
        sut = nil
    }
    
    func test_should_ensure_backendClient_reviced_correct_parameters() async {
        _ = try? await sut.getBestPokemon()
        
        XCTAssertEqual(spy.parametersCaptured!.method.rawValue, "GET")
        XCTAssertEqual(spy.parametersCaptured!.endpoint, PokemonApiService.endpoint)
    }
    
}
