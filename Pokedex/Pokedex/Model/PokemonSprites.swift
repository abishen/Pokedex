//
//  PokemonSprites.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 08/07/2025.
//
import Foundation

struct PokemonSelected: Codable {
    var sprites : PokemonSprites
    var weight : Int
    
}

struct PokemonSprites: Codable {
    var front_default : String
}
