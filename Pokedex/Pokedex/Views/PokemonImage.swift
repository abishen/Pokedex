//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 29/06/2025.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    @State private var pokemonSprites = ""
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprites))
            .frame(width:75, height: 75)
            .onAppear {
                let loadData =  UserDefaults.standard.string(forKey: imageLink)
                
                if loadData == nil {
                    getSprites(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                } else {
                    getSprites(url: loadData!)
                    
                }
            }
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
        
    }
    
    func getSprites(url: String) {
        var tempSprites: String?
        PokemonSelectedApi().fetchPokemon(url: url){ sprites in
            tempSprites = sprites.front_default
            self.pokemonSprites = tempSprites ?? "placeholder"
            
            
        }
        
    }
}

#Preview {
    PokemonImage()
}
