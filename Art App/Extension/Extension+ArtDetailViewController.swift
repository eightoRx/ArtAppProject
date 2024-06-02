//
//  Extension+ArtDetailViewController.swift
//  Art App
//
//  Created by Pavel Kostin on 29.05.2024.
//


import UIKit



extension ArtDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let artist = artist else { print("Miss works"); return 0 }
        return artist.works.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .setupCollectionViewCellID, for: indexPath) as? ArtDetailViewCell else {  print("Error collectionView Cell"); return collectionView.dequeueReusableCell(withReuseIdentifier: .setupCollectionViewCellDefault, for: indexPath) }
        
        if let artWorks = artist?.works[indexPath.item] {
            cell.configure(with: artWorks)
        }
        return cell
    }
}


extension ArtDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let fullVC = FullScreenImageView()
        
        
        guard let selectedWork = artist?.works[indexPath.item],
              let image = UIImage(named: selectedWork.image) else { return }
        
        fullVC.image = image
        fullVC.modalPresentationStyle = .fullScreen
        fullVC.modalTransitionStyle = .coverVertical
//        self.present(fullVC, animated: true, completion: nil)
                self.navigationController?.pushViewController(fullVC, animated: false)
        
    }
    
}


extension ArtDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height: CGFloat = 500
        return CGSize(width: width, height: height)
    }
}

extension String {
    static let setupCollectionViewCellID = "setupCollectionViewCellID"
    static let setupCollectionViewCellDefault = "setupCollectionViewCellDefault"
}


