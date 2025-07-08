//
//  PokemonSelected.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 29/06/2025.
//

import Foundation
import Alamofire
struct PokemonSelected: Codable {
    var sprites : PokemonSprites
    var weight : Int
    
}

struct PokemonSprites: Codable {
    var front_default : String
}

class PokemonSelectedApi {
    
    func FetchPokemonSprites(url: String, completetion : @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        AF.request(url).responseDecodable(of: PokemonSelected.self) { (response) in
            let pokemonSprites = try! response.value?.sprites
            DispatchQueue.main.async {
                completetion(pokemonSprites!)
            }
            
        }.resume()
    }
}
