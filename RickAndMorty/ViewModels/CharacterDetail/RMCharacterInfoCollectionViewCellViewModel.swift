//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 28/04/2025.
//

import Foundation
final class RMCharacterInfoCollectionViewCellViewModel{
    public let value: String
    public let title: String
    
    init(
        value: String,
         title: String
    ){
        self.value = value
        self.title = title
    }
}
