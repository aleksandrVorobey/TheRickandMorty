//
//  RMCharacterStatus.swift
//  TheRickAndMorty
//
//  Created by admin on 17.05.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .unknown:
            return "Unknow"
        case .alive, .dead:
            return rawValue
        }
    }
}
