//
//  User.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 20/09/23.
//

import Foundation

struct User {
    var name : String
    
    var goldSubscriber : Bool = false
}

extension User {
    static let example = User(name: "Iuri", goldSubscriber: true)
}
