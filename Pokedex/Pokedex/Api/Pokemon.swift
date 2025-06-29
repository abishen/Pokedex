//
//  Pokemon.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 28/06/2025.
// https://pokeapi.co/api/v2/pokemon?limit=151

import Foundation
struct Pokemon : Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry : Codable , Identifiable{
    let id = UUID()
    var name : String
    var url : String
}

class PokeApi {
    func fetchPokemon(completeion: @escaping ([PokemonEntry]) -> ()) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=151"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            guard let data = data else {
                return
            }
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            DispatchQueue.main.async {
                completeion(pokemonList.results)
            }
        }.resume()
    }
}
