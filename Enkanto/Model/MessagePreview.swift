//
//  MessageThread.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import Foundation

struct MessagePreview {
    var person : Person
    var lastMessage : String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there.")
}
