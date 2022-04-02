//
//  NetworkConstant.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import FirebaseAuth

class NetworkConstant {
    
    static internal var user:User? {
        get {
            Auth.auth().currentUser
        }
    }
    // check if user is auth
    //TODO: Change string to User data type
    static public func getUser() -> User? {
        return self.user
    }
    
    static func isLogin() -> Bool {
        return user != nil
    }
}
