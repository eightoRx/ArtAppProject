//
//  ArtViewController.swift
//  Art App
//
//  Created by Pavel Kostin on 26.05.2024.
//

import UIKit

class ArtViewController: UIViewController {
    
    var artists: [Artist] = []
    
    var filterArtists: [Artist] = []
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {  return false }
        return text.isEmpty
    }
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ArtViewCell.self, forCellReuseIdentifier: .setupTableViewCellID)
        table.register(UITableViewCell.self, forCellReuseIdentifier: .setupTableViewCellDefault)
        table.showsVerticalScrollIndicator = false
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewColor()
        setupTableView()
        setupViewAppearance()
        setupConstraints()
        configureView()
        setupSearchController()
    }
    
    func configureViewColor() {
        view.backgroundColor = .white
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search artists"
        searchController.definesPresentationContext = true
        
    }
    
    func setupViewAppearance() {
        view.addSubview(tableView)
        
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
        ])
    }
    
    func configureView() {
        
        if let loadData = loadJson(filename: "artists") {
            self.artists = loadData
            self.tableView.reloadData()
        } else {
            print("sdrdederderdew")
        }
    }
}





















    
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        layout.scrollDirection = .horizontal
//        
//        
//        collection.delegate = self
//        collection.dataSource = self
//        collection.backgroundColor = .lightGray
//        collection.register(WelcomeViewCell.self, forCellWithReuseIdentifier: "WelcomeViewCellID")
//        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "WelcomeViewCellDefault")
//        collection.showsVerticalScrollIndicator = false
//        collection.showsHorizontalScrollIndicator = false
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        
//        return collection
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupView()
//        setupConstraint()
//        loadArtist()
//   }
//    
//    func setupView() {
//        view.addSubview(collectionView)
//    }
//    
//    func setupConstraint() {
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//         ])
//        
//    }
//    
//    func loadArtist() {
//        
//        if let loadArtists = loadJSONData(from: json) {
//            self.artist = loadArtists
//            self.collectionView.reloadData()
//        }
//    }
//}
