//
//  Person.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import Foundation

struct Person {
    var name : String
    var imageURLS : [URL]
}

extension Person {
    static let example = Person(name: "Sabrina", imageURLS: [ URL(string: "https://picsum.photos/400/300")!])
}
