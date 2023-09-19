//
//  MessageListVM.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 18/09/23.
//

import Foundation

class MessageListVM: ObservableObject {
    @Published var messagePreview : [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    func loadPreviews() {
        // Handle networking to load messagePreviews from server
        messagePreview = MessagePreview.exampleArray
    }
}
