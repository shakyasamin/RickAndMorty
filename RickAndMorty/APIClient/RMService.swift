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
    
    private let cacheManager = RMAPICacheManager()
    
    /// Privatized constructor
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
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
        if let cachedData = cacheManager.cachedResponse(for: request.endpoint, url: request.url){
            print("Using cached Api Response")

            do {
                let result = try JSONDecoder().decode(type.self, from: cachedData)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
            return
        }
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _ , error in
            guard let data = data, error == nil  else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
                
            }
            //Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                self?.cacheManager.setCache(for: request.endpoint, url: request.url, data: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
        
    }
    
    //Mark: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
    
}

