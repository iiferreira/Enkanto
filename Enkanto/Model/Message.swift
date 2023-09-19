//
//  Message.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import Foundation

struct Message : Hashable {
    
    
    var content : String
    var person : Person? = nil
    
    var fromCurrentUser: Bool {
        return person == nil
    }
}

extension Message {
    static let exampleSent = Message(content: "Hello !")
    static let exampleReceived = Message(content: "Hi", person: Person.example)
}
