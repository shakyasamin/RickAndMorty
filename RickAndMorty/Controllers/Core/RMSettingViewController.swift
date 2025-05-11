//
//  RMSettingViewController.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 21/04/2025.
//

import UIKit
/// Controller to show various app options and Settings

final class RMSettingViewController: UIViewController {
    
    private let viewModel = RMSettingsViewViewModel(
        cellViewModels: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellViewModel(type: $0)
        })
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
    }
    


}
