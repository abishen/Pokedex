//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Dillon Dhayanandan on 07/07/2025.
//
import SwiftUI
struct PokemonDetailView: View {
    var imageLink = ""
    @State var name: String = ""
    var body: some View {
        PokemonImage(imageLink: "\(imageLink)", width: 200, height: 200).padding(.trailing,20)
        Text("Pokemon Detail \(name)")
    }
}
