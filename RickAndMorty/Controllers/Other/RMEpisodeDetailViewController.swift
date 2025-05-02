//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 02/05/2025.
//

import UIKit

/// vc to show about single episode
class RMEpisodeDetailViewController: UIViewController {
    
    private let url: URL?
    
    //MARK: - init
    
    init(url: URL?) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK : - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Episode"
        view.backgroundColor = .systemPink

    }
}
