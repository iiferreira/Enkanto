//
//  UserManager.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 20/09/23.
//

import Foundation

class UserManager : ObservableObject {
    
    @Published var currentUser : User = User(name: "", age: 0, jobTitle: "")
    @Published var matches : [Person] = []
    @Published var topPicks : [Person] = []
    
    init() {
        loadUsers()
        loadMatches()
        loadTopPicks()
    }
    
    private func loadUsers() {
        self.currentUser = User.example
    }
    
    private func loadMatches() {
        self.matches = Person.examples
    }
    
    private func loadTopPicks() {
        self.topPicks = Person.examples.shuffled()
    }
}
