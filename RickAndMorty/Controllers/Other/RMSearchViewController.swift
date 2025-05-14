//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 04/05/2025.
//

import UIKit

/// Configurable controller to search
final class RMSearchViewController: UIViewController {
    
    /// Configuration for search session
    struct Config{
        enum `Type`{
            case character //   name | status | gender
            case episode // name
            case location //    name | type
            
            var title: String {
                switch self {
                case .character:
                    return "Search Characters"
                case .location:
                    return "Search Location"
                case .episode:
                    return "Search Episode"
                }
            }
        }
        
        let type: `Type`
    }
    
    // MARK: - Init
    private let viewModel: RMSearchViewViewModel
    private let searchView: RMSearchView
    
    init(config: Config) {
        let viewModel = RMSearchViewViewModel(config: config)
        self.viewModel = viewModel
        self.searchView = RMSearchView(frame: .zero, viewModel: RMSearchViewViewModel(config: config))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Mark: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.config.type.title
        view.backgroundColor = .systemBackground
        view.addSubview(searchView)
        addConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .done, target: self, action: #selector(didTapExecuteSearch))
    }
    
    @objc
    private func didTapExecuteSearch() {
//        viewModel.executeSearch()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }
    
}
