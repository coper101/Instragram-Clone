//
//  Model.swift
//  Instragram
//
//  Created by Wind Versi on 5/4/22.
//

import Foundation

struct Post: Identifiable {
    let id = UUID().uuidString
    var imageName: String? = nil
    var user: User = User()
}

struct User: Identifiable {
    var id = UUID().uuidString
    var username: String = "username"
    var userImageName: String? = nil
    var hasStory: Bool = true
}
