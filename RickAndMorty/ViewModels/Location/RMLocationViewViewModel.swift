//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 13/05/2025.
//

import Foundation

final class RMLocationViewViewModel{
    
    private var locations: [RMLocation] = []
    
    private var cellViewModels: [String] = []
    
    //Location response info
    //will contain next url, if present
    
    init() {}
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let model):
                break
            }
        }
    }
}
