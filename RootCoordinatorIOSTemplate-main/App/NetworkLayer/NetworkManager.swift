//
//  NetworkManager.swift
//  RootCoordinatorTemplate
//
//  Created by Farhandika on 26/03/22.
//

import Foundation

class NetworkManager {
    
    static func requestLogin(
        completion: @escaping (Result<String, Error>) -> ()
    ) {
        completion(.success("success"))
    }
    
    func request<T: Decodable>(
        target: NetworkAPI,
        completion: @escaping (Result<T, Error>) -> ()) {
            let request = target.urlRequest
            
            let task = URLSession.shared.dataTask(with: request) { (data,_,error) in
                
                if let data = data {
                    do  {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
    }
}
