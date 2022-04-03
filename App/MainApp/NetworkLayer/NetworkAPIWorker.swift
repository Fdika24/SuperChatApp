//
//  NetworkAPIWorker.swift
//  RootCoordinatorTemplate
//
//  Created by Farhandika on 26/03/22.
//

import Foundation

extension NetworkAPI {
    private var rootLink:String {
        return ""
    }
    private var urlComponent:URLComponents? {
        var component = URLComponents(string: "\(self.rootLink)/\(self.path)")
        component?.queryItems = self.queryItems
        return component
    }
    
    public var urlRequest:URLRequest {
        var req = URLRequest(url: self.urlComponent!.url!)
        switch self {
        case .post(let postPath):
            req.httpMethod = "POST"
            switch postPath {
            case .auth:
                req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            }
        case .get(let getPath):
            req.httpMethod = "GET"
            switch getPath {
            case .getSomething :
                print("something")
            }
        case .login(type: let type):
            print("nothing")
        }
        return req
    }
    
    private var queryItems:[URLQueryItem] {
        switch self {
        case .post(let postPath):
            switch postPath {
            case .auth:
                return []
            }
        case .get(let getPath):
            switch getPath {
            case .getSomething : return []
            }
        case .login(type: let type):
            return []
        }
    }
    
    private var path:String {
        switch self {
        case .post(let postPath):
            switch postPath {
            case .auth:
                return ""
            }
        case .get(let getPath):
            switch getPath {
            case .getSomething :
                return ""
            }
        case .login(type: let type):
            return ""
        }
    }
    
}
