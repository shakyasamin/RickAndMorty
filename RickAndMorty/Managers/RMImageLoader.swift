//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 23/04/2025.
//

import Foundation

final class RMImageLoader{
    static let shared = RMImageLoader()
    
    private var imageDataChache = NSCache<NSString, NSData>()
    
    private init() {}
    
    public func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let key = url.absoluteString as NSString
        if let data = imageDataChache.object(forKey: key){
            completion(.success(data as Data)) //NSDAta ==Data | NSString ++ string
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            let value = data as NSData
            self.imageDataChache.setObject(value, forKey: key)
            completion(.success(data))
        }
        
        task.resume()
    }
}
