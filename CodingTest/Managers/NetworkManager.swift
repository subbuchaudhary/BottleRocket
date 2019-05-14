//
//  NetworkManager.swift
//  CodingTest
//
//  Created by Subbu Chaudhary on 5/13/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    
    static let sharedManager = NetworkManager()
    typealias restaurantsHandler = (Result<LunchModel, Error>) -> ()
    
    func fetchData(path: String, completion: @escaping restaurantsHandler) {
        guard let url = URL(string: path) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard let responseData = data else {
                return
            }
            do {
                let lunchModel = try JSONDecoder().decode(LunchModel.self, from: responseData)
                completion(.success(lunchModel))
            } catch let err {
                completion(.failure(err))
            }
        }.resume()
    }

}
