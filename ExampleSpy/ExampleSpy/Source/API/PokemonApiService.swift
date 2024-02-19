//
//  PokemonApiService.swift
//  ExampleSpy
//
//  Created by Pedro Somensi on 13/02/24.
//

import Foundation

final class PokemonApiService {
    
    static let endpoint = "https://pokeapi.co/api/v2/pokemon/charizard"
    
    private let client: BackendClientProtocol
    
    init(client: BackendClientProtocol) {
        self.client = client
    }
    
    func getBestPokemon() async throws -> Pokemon? {
        let parameters = RequestParameters(
            method: .get,
            endPoint: PokemonApiService.endpoint
        )
        
        do {
            let data = try await client.request(parameters: parameters)
            let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
            return pokemon
        } catch {
            print("error: \(error)")
        }
        
        return nil
    }
    
}
