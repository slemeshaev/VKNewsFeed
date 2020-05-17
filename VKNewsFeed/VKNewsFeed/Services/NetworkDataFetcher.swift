//
//  NetworkDataFetcher.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 17.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func getFeed(reponse: @escaping (FeedResponse?) -> ())
}

struct NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init(networking: Networking ) {
        self.networking = networking
    }
    
    func getFeed(reponse: @escaping (FeedResponse?) -> ()) {
        let params = ["filters": "post, photo"]
        networking.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error received requestion data: \(error.localizedDescription)")
                reponse(nil)
            }
            
            let decoded = self.decodeJSON(type: FeedResponseWrapped.self, from: data)
            reponse(decoded?.response)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
