//
//  FullScreenImageView.swift
//  Art App
//
//  Created by Pavel Kostin on 28.05.2024.
//

import Foundation
import UIKit

class FullScreenImageView: UIViewController {
    
    var image: UIImage?
    
    let fullImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(recognize))

        view.addGestureRecognizer(tap)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupConstraints()
        setupViews()

    }
    
    func setupAppearance() {
        view.addSubview(fullImage)
    }
    
    func setupViews() {
        fullImage.image = image
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            fullImage.topAnchor.constraint(equalTo: view.topAnchor),
            fullImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fullImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    

    
    @objc func recognize() {
        dismiss(animated: true)
    }
}
