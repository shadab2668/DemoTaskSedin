//
//  UserDetails.swift
//  DemoTaskSedin
//
//  Created by Shadab Hussain on 13/02/22.
//

import Foundation

struct UserData: Codable {
    var  title: String?
    var created_at: String?
    var user: User?
}
struct User:Codable {
    var login: String?
    var avatar_url: String?

}

