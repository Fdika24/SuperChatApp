//
//  DatabaseManager.swift
//  SuperChatApp
//
//  Created by Farhandika on 03/04/22.
//

import Foundation
import FirebaseDatabase

class DatabaseManager {
    
    private struct childPath {
        let users = "users"
    }
    
    private let path = childPath()
    
    static let shared = DatabaseManager()
    private let dbRef: DatabaseReference = Database.database(url: "https://super-chat-app-5211d-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    
    //MARK: - ADD NEW USER TO DATABASE
    func addNewUser(
        user:ChatUserModel,
        completion: @escaping (Result<String, Error>) -> ()
    ) {
        self.dbRef.child(path.users).child(user.uniqueID).setValue([
            "uniqueID":user.uniqueID,
            "data": [
                "uid":user.uid,
                "displayName": user.displayName,
                "email": user.email
            ]
        ])
        completion(.success("success"))
    }
    
    //MARK: - CHECK IF USER IS AVAILABLE IN THE DATABASE
    func getUser(
        key:String,
        completion: @escaping (Result<ChatUserModel, Error>) -> ()
    ) {
        self.dbRef.child(path.users).child(key).observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? NSDictionary else {
                return
            }
            let tempData = value["data"] as! NSDictionary
            let data = ChatUserModel(
                displayName: tempData["displayName"] as! String,
                uid: tempData["uid"] as! String,
                email: tempData["email"] as! String,
                uniqueID: key)

            completion(.success(data))
        }
    }
}
