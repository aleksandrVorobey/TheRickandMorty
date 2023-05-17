//
//  RMService.swift
//  TheRickAndMorty
//
//  Created by admin on 17.05.2023.
//

import Foundation

final class RMService {
    static let shared = RMService()
    private init() {}
    
    func execute(_request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
