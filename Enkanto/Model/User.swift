//
//  User.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 20/09/23.
//

import Foundation

struct User {
    var name : String
    var age : Int
    var jobTitle : String
    
    var goldSubscriber : Bool = false
    var profileTip : String = ""
    
    var imageURL : [URL] = []
}

extension User {
    static let example = User(name: "Iuri",
                              age: 39,
                              jobTitle: "Software Engineer",
                              goldSubscriber: true,
                              profileTip: "Photo Tip: Make wave with beach photo and get more likes",
                              imageURL: [URL(string: "https://picsum.photos/400/300")!])
}
