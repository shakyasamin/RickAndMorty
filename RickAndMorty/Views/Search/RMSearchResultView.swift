//
//  RMSearchResultView.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 16/05/2025.
//

import UIKit

/// Show search result s UI (Table aor Collection view as needed)
final class RMSearchResultView: UIView {
    
    private var viewModel: RMSearchResultViewModel? {
        didSet{
            self.processViewModel()
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(RMLocationTableViewCell.self, forCellReuseIdentifier: RMLocationTableViewCell.cellIdentifier)
        table.isHidden = true
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    //Mark: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews(tableView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func processViewModel() {
        guard let viewModel = viewModel else {
            return
        }
        switch viewModel {
        case .characters(let viewModels):
            setUpCollectionView()
        case .locations(let viewModels):
            setUpTableView()

        case .episodes(let viewModels):
            setUpCollectionView()

        }
    }
    
    private func setUpCollectionView(){
        
    }
    
    private func setUpTableView() {
        tableView.isHidden = false
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
        tableView.backgroundColor = .yellow
    }
    
    public func configure(with viewModel: RMSearchResultViewModel) {
        self.viewModel = viewModel
    }

}
