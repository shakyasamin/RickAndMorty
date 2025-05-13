//
//  RMGetAllLocationsResponse.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 13/05/2025.
//

import Foundation
struct RMGetAllLocationsResponse: Codable {
    struct Info: Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMLocation]
}
