//
//  RMCharacterCollectionViewCellViewModel.swift
//  TheRickAndMorty
//
//  Created by admin on 18.05.2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {
    
    let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageURL: URL?
    
    var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageURL: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageURL = characterImageURL
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageURL)
    }
    
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = characterImageURL else {
            completion(.failure(URLError(.badURL)))
            return }
        RMImageLoader.shared.downloadImage(url, completion: completion)
    }
}
