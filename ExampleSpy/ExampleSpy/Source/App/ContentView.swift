//
//  ContentView.swift
//  ExampleSpy
//
//  Created by Pedro Somensi on 13/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var bestPokemon: String = ""
    
    var pokemonService = PokemonApiService(client: BackendClient())
    
    var body: some View {
        VStack {
            Button("qual o melhor pokemon?") {
                Task {
                    if let pokemon = try? await pokemonService.getBestPokemon() {
                        bestPokemon = pokemon.name.capitalized
                    }
                }
            }
            Text(bestPokemon)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
