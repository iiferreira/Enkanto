//
//  UserManager.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 20/09/23.
//

import Foundation

enum SwipeDirection {
    case like, nope
}

class UserManager : ObservableObject {
    
    @Published var currentUser : User = User(name: "", age: 0, jobTitle: "")
    @Published var matches : [Person] = []
    @Published var topPicks : [Person] = []
    @Published var cardPeople : [Person] = []
    
    init() {
        loadUsers()
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    
    private func loadCardPeople() {
        self.cardPeople = Person.examples.shuffled()
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
    
    public func swipe(_ person : Person, _ direction:SwipeDirection) {
        cardPeople.removeLast()
    }
    
    public func superLike(_ person : Person) {
        cardPeople.removeLast()
    }
}
