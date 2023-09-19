//
//  MessageThread.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import Foundation

struct MessagePreview : Hashable {
    var person : Person
    var lastMessage : String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there.")
    static let example2 = MessagePreview(person: Person.example2, lastMessage: "How are you?")
    
    static let exampleArray : [MessagePreview] = [MessagePreview.example, MessagePreview.example2]
}
