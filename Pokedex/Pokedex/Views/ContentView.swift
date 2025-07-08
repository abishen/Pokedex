//
//  ContentView.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 28/06/2025.
//

import SwiftUI
import Alamofire
struct ContentView: View {
    @StateObject var viewModel =  PokemonViewModel()
    @State var SearchText = ""
    var body: some View {
        NavigationView() {
            List {
                
                ForEach(SearchText == "" ? viewModel.pokemonList : viewModel.pokemonList.filter({
                    $0.name.contains(SearchText.lowercased())
                })) { entry in
                    HStack{
                        PokemonImage(imageLink: "\(entry.url)").padding(.trailing,20)
                        //NavigationLink("\(entry.name)".capitalized, destination: Text("Detail View for \(entry.name)"))
                        
                        NavigationLink("\(entry.name)".capitalized, destination: PokemonDetailView(imageLink: entry.url, name: entry.name))
                                
                    }
                    
                }
            }.searchable(text: $SearchText)
                .navigationTitle("Pokedex")
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
