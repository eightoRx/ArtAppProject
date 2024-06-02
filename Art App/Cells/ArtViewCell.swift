//
//  ArtViewCell.swift
//  Art App
//
//  Created by Pavel Kostin on 28.05.2024.
//

import UIKit

class ArtViewCell: UITableViewCell {
    
    let imageViews = UIImageView()
    let lableBio = UILabel()
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupAppearance()
        setupConstraints()
        configureViews()
    }
    
    func setupAppearance() {
        contentView.addSubview(imageViews)
        contentView.addSubview(lableBio)
    }
    
    func setupConstraints() {
        imageViews.translatesAutoresizingMaskIntoConstraints = false
        lableBio.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageViews.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageViews.widthAnchor.constraint(equalToConstant: 150),
            imageViews.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            lableBio.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            lableBio.leadingAnchor.constraint(equalTo: imageViews.trailingAnchor, constant: 16),
            lableBio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        
        
        ])
    }
    
    func configureViews() {
        backgroundColor = .clear

        imageViews.contentMode = .scaleAspectFit
        
        lableBio.textColor = .black
        lableBio.numberOfLines = 0
        lableBio.textAlignment = .center
        lableBio.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    
    func configureData(with artist: Artist) {
        imageViews.image = UIImage(named: artist.image)
        lableBio.text = artist.bio
    }

}

