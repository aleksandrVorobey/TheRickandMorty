//
//  RMImageLoader.swift
//  TheRickAndMorty
//
//  Created by admin on 22.05.2023.
//

import Foundation

final class RMImageLoader {
    static let shared = RMImageLoader()
    
    private var imageDataCashe = NSCache<NSString, NSData>()
    
    private init(){}
    
    func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        
        if let data = imageDataCashe.object(forKey: key) {
            completion(.success(data as Data))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return }
            let value = data as NSData
            self?.imageDataCashe.setObject(value, forKey: key)
            completion(.success(data))
        }
        task.resume()
    }
}
