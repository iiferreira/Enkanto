//
//  ChatManager.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import Foundation

class ChatManager : ObservableObject {
    @Published var messages : [Message] = []
    
    private var person : Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
    }
    
    private func loadMessages() {
        self.messages = [Message.exampleSent, Message.exampleReceived]
    }
}
