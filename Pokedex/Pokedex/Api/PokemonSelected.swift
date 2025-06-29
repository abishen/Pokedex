//
//  PokemonSelected.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 29/06/2025.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites : PokemonSprites
    var weight : Int
    
}

struct PokemonSprites: Codable {
    var front_default : String
}

class PokemonSelectedApi {
    func fetchPokemon(url: String ,completeion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            guard let data = data else {
                return
            }
            let pokemonSpirit = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            DispatchQueue.main.async {
                completeion(pokemonSpirit.sprites)
            }
        }.resume()
    }
}
