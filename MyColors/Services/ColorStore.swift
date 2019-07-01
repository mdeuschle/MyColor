//
//  ColorStore.swift
//  MyColors
//
//  Created by Matt Deuschle on 6/30/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import Foundation

struct ColorStore {
    private init() {}
    static let shared = ColorStore()
    func downloadColors(completion: @escaping (Result<[Color], Error>) -> Void) {
        WebService.shared.dataTask { result in
            switch result {
            case .success(let data):
                do {
                    let colors = try JSONDecoder().decode([Color].self, from: data)
                    completion(.success(colors))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
