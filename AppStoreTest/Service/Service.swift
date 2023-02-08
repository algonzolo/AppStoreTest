//
//  Service.swift
//  AppStoreTest
//
//  Created by Albert Garipov on 01.02.2023.
//

import Foundation

class Service {

    static let shared = Service()

    func fetchApps(searchTerm: String, completion: @escaping ([Result]) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            guard let data = data else {return}
            do {
                let searchResult = try
                JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
            } catch {
                print("Failed to decode json file")
            }
        }.resume()
    }
}
