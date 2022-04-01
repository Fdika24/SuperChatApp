//
//  NetworkAPI.swift
//  RootCoordinatorTemplate
//
//  Created by Farhandika on 26/03/22.
//

import Foundation

enum NetworkAPI {
    enum getRequest {
        case getSomething
    }
    
    enum postRequest {
        case auth
    }
    
    case post(postPath:postRequest)
    case get(getPath:getRequest)
}
