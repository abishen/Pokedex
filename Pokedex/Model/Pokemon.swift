//
//  Pokemon.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 08/07/2025.
//
import Foundation

struct Pokemon : Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry : Codable , Identifiable{
    let id = UUID()
    var name : String
    var url : String
}
