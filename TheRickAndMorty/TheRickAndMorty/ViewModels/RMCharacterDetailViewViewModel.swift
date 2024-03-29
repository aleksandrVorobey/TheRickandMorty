//
//  RMCharacterDetailViewViewModel.swift
//  TheRickAndMorty
//
//  Created by admin on 19.05.2023.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    var title: String {
        return character.name.uppercased()
    }
    
    private  var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    init(character: RMCharacter) {
        self.character = character
    }
}
