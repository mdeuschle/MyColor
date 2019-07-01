//
//  WebService.swift
//  MyColors
//
//  Created by Matt Deuschle on 6/30/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import Foundation

struct WebService {
    private init() {}
    static let shared = WebService()
    func dataTask(completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString = "http://www.colourlovers.com/api/colors?format=json"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if data != nil && error == nil {
                    completion(.success(data!))
                } else {
                    completion(.failure(error!))
                }
            }
        }
        task.resume()
    }
}
