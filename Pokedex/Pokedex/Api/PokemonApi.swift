//
//  Pokemon.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 28/06/2025.
// https://pokeapi.co/api/v2/pokemon?limit=151

import Foundation
import Alamofire
struct Pokemon : Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry : Codable , Identifiable{
    let id = UUID()
    var name : String
    var url : String
}

class PokeApi {
    func FetchPokemon(complete: @escaping ([PokemonEntry]) -> ()) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=151"
        guard let url = URL(string: urlString) else {
            return
        }
        AF.request(url).responseDecodable(of: Pokemon.self) { response in
            let PokemonList = try! response.value?.results
            DispatchQueue.main.async {
                complete(PokemonList!)
            }
        }.resume()
        
    }
}
