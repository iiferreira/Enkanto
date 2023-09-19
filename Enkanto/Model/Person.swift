//
//  Person.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import Foundation

struct Person : Hashable {
    var name : String
    var imageURLS : [URL]
    var bio : String
}

extension Person {
    static let example = Person(name: "Sa", imageURLS: [ URL(string: "https://picsum.photos/400/300")!], bio: "This is my bio")
    static let example2 = Person(name: "Su", imageURLS: [ URL(string: "https://picsum.photos/401/300")!], bio: " I love rock !")
}
