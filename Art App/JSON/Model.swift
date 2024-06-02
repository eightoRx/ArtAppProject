//
//  Model.swift
//  Art App
//
//  Created by Pavel Kostin on 26.05.2024.
//

import Foundation


// MARK: - Welcome
struct Welcome: Codable {
    let artists: [Artist]
}

// MARK: - Artist
struct Artist: Codable {
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

// MARK: - Work
struct Work: Codable {
    let title: String
    let image: String
    let info: String
}

