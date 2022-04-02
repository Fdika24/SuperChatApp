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
    
    enum loginType {
        case email(email:String,password:String)
    }
    
    case post(postPath:postRequest)
    case get(getPath:getRequest)
    case login(type:loginType)
    
}
