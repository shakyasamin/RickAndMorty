//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 02/05/2025.
//

import UIKit

/// vc to show about single episode
class RMEpisodeDetailViewController: UIViewController, RMEpisodeDetailViewViewModelDelegate, RMEpisodeDetailViewDelegate {
    
    private let viewModel: RMEpisodeDetailViewViewModel
    
    private let detailView = RMEpisodeDetailView()
    
    //MARK: - init
    
    init(url: URL?) {
        self.viewModel = RMEpisodeDetailViewViewModel(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK : - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(detailView)
        addConstraints()
        
        detailView.delegate = self
        
        title = "Episode"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
        
        viewModel.delegate = self
        viewModel.fetchEpisodeData()
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc
    private func didTapShare() {
        
    }
    
    //Mark: - View Delegate
    
    func rmEpisodeDetailView(_ detailView: RMEpisodeDetailView, didSelect character: RMCharacter) {
        let vc = RMCharacterDetailViewController(viewModel: .init(character: character))
        vc.title = character.name
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - ViewModel Delegate
    
    func didFetchEpisodeDetails() {
        detailView.configure(with: viewModel)
    }
}
