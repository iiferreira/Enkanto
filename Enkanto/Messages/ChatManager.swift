//
//  ChatManager.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import Foundation
import Combine
import UIKit

class ChatManager : ObservableObject {
    @Published var messages : [Message] = []
    @Published var keyboardIsShowing : Bool = false
    
    var cancellable : AnyCancellable?
    
    private var person : Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
        setupPublishers()
    }
    
    public func sendMessage(_ message: Message) {
        messages.append(message)
    }
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map( { _ in true })
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map( { _ in false })
    
    private func setupPublishers() {
        cancellable = Publishers.Merge(keyboardWillShow,keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    private func loadMessages() {
        self.messages = [Message.exampleSent, Message.exampleReceived]
    }
    
    deinit{
        cancellable?.cancel()
    }

}
