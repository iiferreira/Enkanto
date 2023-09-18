//
//  ChatView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var chatManager : ChatManager
    
    @State private var typingMessage : String = ""
    
    private var person : Person
    
    init(person: Person) {
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    
    var body: some View {
        ZStack(alignment:.top) {
            VStack {
                Spacer().frame(height: 60)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(chatManager.messages.indices, id: \.self) { index in
                            let msg = chatManager.messages[index]
                            MessageView(message: msg)
                        }
                    }
                }
                
                ZStack(alignment:.trailing) {
                    Color.textfieldBG
                        .frame(height: 45)
                    TextField("Type a message", text: $typingMessage)
                        .foregroundColor(Color.textPrimary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                        .padding(.horizontal)
                    
                    Button {
                 
                        sendMessage()
                    } label: {
                        Text("Send")
                            .padding(.horizontal)
                            .foregroundColor(typingMessage.isEmpty ? Color.textPrimary : Color.blue )
                    }
                }
                .cornerRadius(12)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                }
                .padding(.horizontal)
                .padding(.vertical)
                
            }
            
            ChatViewHeader(name: person.name, imageURL: person.imageURLS.first) {
                //Video action
            }
        }
        
        .navigationTitle("")
        .navigationBarHidden(true)
//        .toolbar(.hidden, for: .navigationBar)
    }
    
    //Helper functions
    func sendMessage() {
        chatManager.sendMessage(Message(content: typingMessage))
        print(typingMessage)
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
