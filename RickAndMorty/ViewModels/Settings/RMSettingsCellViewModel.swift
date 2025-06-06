//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 11/05/2025.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable {
    let id = UUID()
    
    public let type: RMSettingsOption
    public let onTapHandler: (RMSettingsOption) -> Void

    //MARK: - Init
    init(type: RMSettingsOption, onTapHandler: @escaping (RMSettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
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
