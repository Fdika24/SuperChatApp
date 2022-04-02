//
//  NetworkConstant.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import FirebaseAuth

struct UserDetail {
    private static let emailKey = "email"
    private static let passwordKey = "password"
    
    static var email:String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? ""
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    
    static var password:String {
        get {
            return UserDefaults.standard.string(forKey: passwordKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: passwordKey)
        }
    }
    
    static func synchronize() {
        UserDefaults.standard.synchronize()
    }
    
    static func deteleAll() -> Bool {
        if let domain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: domain)
            synchronize()
            return true
        } else { return false }
    }
}

class NetworkConstant {
    
    static internal var user:User?
    // check if user is auth
    //TODO: Change string to User data type
    static public func getUser() -> User? {
        return self.user
    }
}
