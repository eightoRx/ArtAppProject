//
//  Extension+ArteViewController.swift
//  Art App
//
//  Created by Pavel Kostin on 28.05.2024.
//

import Foundation
import UIKit

extension ArtViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filterArtists.count
        } else {
            return artists.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: .setupTableViewCellID, for: indexPath) as? ArtViewCell else { return tableView.dequeueReusableCell(withIdentifier: .setupTableViewCellDefault, for: indexPath) }
        
        let artist: Artist
        
        if isFiltering {
            artist = filterArtists[indexPath.row]
        } else {
            artist = artists[indexPath.row]
        }
        
        cell.configureData(with: artist)
        
        
        return cell
    }
}


extension ArtViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let artist: Artist
        
        if isFiltering {
            artist = filterArtists[indexPath.row]
        } else {
            artist = artists[indexPath.row]
        }
        
        let dvcController = ArtDetailViewController()
        dvcController.artist = artist
        navigationController?.pushViewController(dvcController, animated: false)
    }
}

extension ArtViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "Nop")
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filterArtists = artists.filter {
            return $0.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
}


extension String {
    
    static let setupTableViewCellID = "setupTableViewCellID"
    static let setupTableViewCellDefault = "setupTableViewCellDefault"
}

