//
//  NetworkManager.swift
//  RootCoordinatorTemplate
//
//  Created by Farhandika on 26/03/22.
//

import Foundation
import FirebaseAuth

class NetworkManager {
    
    func requestlogout(
        completion: @escaping (Result<String, Error>) -> ()
    ) {
        do {
            try Auth.auth().signOut()
            completion(.success("success"))
        } catch (let error) {
            completion(.failure(error))
        }
    }
    
    func requestLogin(
        target:NetworkAPI.loginType,
        completion: @escaping (Result<String, Error>) -> ()
    ) {
        switch target {
        case .email(let email,let password):
            self.loginByEmail(
                email: email, password: password,
                completion: completion)
        }
    }
    
    private func loginByEmail(
        email:String,
        password:String,
        completion: @escaping (Result<String, Error>) -> ()
    ) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                completion(.failure(error!))
            } else {
                //TODO: Add something to the closure
                completion(.success("success"))
            }
            
        }
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
