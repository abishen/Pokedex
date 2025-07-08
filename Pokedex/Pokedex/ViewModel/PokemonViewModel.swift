//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 08/07/2025.
//
import Foundation

class PokemonViewModel : ObservableObject {
    @Published var pokemonList = [PokemonEntry]()
    var service = PokeApi()
    init() {
        service.FetchPokemon {PokemonList in
            PokemonList.forEach {pokemon in
                print("\(pokemon.name)")
            }
            DispatchQueue.main.async {
                self.pokemonList = PokemonList
            }
        }
    }
}
