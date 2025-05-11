//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 11/05/2025.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()
    
    private let type: RMSettingsOption

    //MARK: - Init
    init(type: RMSettingsOption) {
        self.type = type
    }
    
    //MARk: Public
    public var  image: UIImage? {
        return type.iconImage
    }
    
    public var  title: String {
        return type.displayTitle
    }
    
    public var iconConatinerColor: UIColor {
        return type.iconCOntainerColor
    }
    
    
    
}
