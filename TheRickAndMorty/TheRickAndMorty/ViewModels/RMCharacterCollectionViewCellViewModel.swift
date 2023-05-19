//
//  RMCharacterCollectionViewCellViewModel.swift
//  TheRickAndMorty
//
//  Created by admin on 18.05.2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
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
    
    func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = characterImageURL else {
            completion(.failure(URLError(.badURL)))
            return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return }
            completion(.success(data))
        }
        task.resume()
    }
}
