//
//  UserModel.swift
//  SuperChatApp
//
//  Created by Farhandika on 03/04/22.
//

import Foundation

struct ChatUserModel:Codable {
    let displayName:String
    let uid:String
    let email:String
    let uniqueID:String
}
