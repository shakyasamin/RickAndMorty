//
//  RMService.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 21/04/2025.
//

import Foundation

/// Priimary API service object to get Rick and Morty data
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: request instance
    ///   - completion: callback with data and error
    ///   - type: The type of object we expect to get back
    public func execute<T: Codable>(
        _ request:RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        
    }
    
    
}

