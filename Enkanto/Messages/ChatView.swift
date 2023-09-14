//
//  ChatView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var chatManager : ChatManager
    
    private var person : Person
    
    init(person: Person) {
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(chatManager.messages.indices, id: \.self) { index in
                    let msg = chatManager.messages[index]
                    MessageView(message: msg)
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
