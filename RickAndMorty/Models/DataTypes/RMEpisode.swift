//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 21/04/2025.
//

import Foundation

struct RMEpisode: Codable {
    let id : Int
    let name : String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
