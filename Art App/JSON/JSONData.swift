//
//  JSONData.swift
//  Art App
//
//  Created by Pavel Kostin on 28.05.2024.
//

import Foundation

func loadJson(filename fileName: String) -> [Artist]? {
    if let url = Bundle.main.url(forResource: "artists", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Welcome.self, from: data)
            return jsonData.artists
        } catch {
            print("Error loading JSON data: \(error)")
        }
    }
    return nil
}
