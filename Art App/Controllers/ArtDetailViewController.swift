//
//  ArtDetailViewController.swift
//  Art App
//
//  Created by Pavel Kostin on 28.05.2024.
//


import UIKit

class ArtDetailViewController: UIViewController {
    
    var works: Work?
    var artist: Artist?

    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        collection.backgroundColor = .clear
        collection.register(ArtDetailViewCell.self, forCellWithReuseIdentifier: .setupCollectionViewCellID)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: .setupCollectionViewCellDefault)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupCollectionView()
        setupConstraints()
        
    }
    
    func setupAppearance() {
        view.addSubview(collectionView)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
   
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
   }
}

