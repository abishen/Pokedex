//
//  ContentView.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 28/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var SearchText = ""
    var body: some View {
        NavigationView() {
            List {
                ForEach(SearchText == "" ? pokemon : pokemon.filter({
                    $0.name.contains(SearchText.lowercased())
                })) { entry in
                    HStack{
                        PokemonImage(imageLink: "\(entry.url)").padding(.trailing,20)
                        NavigationLink("\(entry.name)".capitalized, destination: Text("Detail View for \(entry.name)"))
                                
                    }
                    
                }
            }.onAppear(){
             PokeApi().fetchPokemon { (pokemon) in
                    self.pokemon = pokemon
                 for pokemon in pokemon {
                     print(pokemon.name)
                 }
                }
                
            }.searchable(text: $SearchText)
                .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    ContentView()
}
