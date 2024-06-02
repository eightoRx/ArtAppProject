//
//  ArtDetailViewCell.swift
//  Art App
//
//  Created by Pavel Kostin on 28.05.2024.
//

import UIKit

class ArtDetailViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let bioLable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        lable.numberOfLines = 0
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = .systemFont(ofSize: 14, weight: .regular)
        lable.textColor = .gray
        return lable
    }()
    
    let nameImage: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = .systemFont(ofSize: 16, weight: .medium)
        lable.textColor = .black
        lable.numberOfLines = 0
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCell()

    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupCell() {
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameImage)
        contentView.addSubview(bioLable)
        
        NSLayoutConstraint.activate([
            nameImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            imageView.topAnchor.constraint(equalTo: nameImage.bottomAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            bioLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            bioLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bioLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
  }
    
    func configure(with works: Work) {
        nameImage.text = works.title
        imageView.image = UIImage(named: works.image)
        bioLable.text = works.info
    }
}

