//
//  Person.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import Foundation

struct Person : Hashable, Identifiable {
    let id = UUID().uuidString 
    var name : String
    var imageURLS : [URL]
    var bio : String
    var age : Int
}

extension Person {
    static let example = Person(name: "Sa", imageURLS: [ URL(string: "https://picsum.photos/400/300")!], bio: "This is my bio", age:34)
    static let example2 = Person(name: "Su", imageURLS: [ URL(string: "https://picsum.photos/401/300")!], bio: " I love rock !", age:41)
    
    static let examples : [Person] = [
        Person(name: "Sa", imageURLS: [ URL(string: "https://picsum.photos/400/300")!], bio: "This is my bio", age:34),
        Person(name: "Suenita", imageURLS: [ URL(string: "https://picsum.photos/401/300")!], bio: "This is my bio", age:31),
        Person(name: "Sorenia", imageURLS: [ URL(string: "https://picsum.photos/402/300")!], bio: "This is my bio", age:44),
        Person(name: "Sira", imageURLS: [ URL(string: "https://picsum.photos/403/300")!], bio: "This is my bio", age:24),
        Person(name: "Sudina", imageURLS: [ URL(string: "https://picsum.photos/404/300")!], bio: "This is my bio", age:22),
        Person(name: "Sayca", imageURLS: [ URL(string: "https://picsum.photos/406/300")!], bio: "This is my bio", age:32),
        Person(name: "Sassiana", imageURLS: [ URL(string: "https://picsum.photos/420/300")!], bio: "This is my bio", age:24),
        Person(name: "Savilena", imageURLS: [ URL(string: "https://picsum.photos/407/300")!], bio: "This is my bio", age:25),
        Person(name: "Sacalla", imageURLS: [ URL(string: "https://picsum.photos/408/300")!], bio: "This is my bio", age:26),
        Person(name: "Sadine", imageURLS: [ URL(string: "https://picsum.photos/409/300")!], bio: "This is my bio", age:33),
        Person(name: "Saqua", imageURLS: [ URL(string: "https://picsum.photos/410/300")!], bio: "This is my bio", age:32),
        Person(name: "Saera", imageURLS: [ URL(string: "https://picsum.photos/411/300")!], bio: "This is my bio", age:31),
        Person(name: "Satri", imageURLS: [ URL(string: "https://picsum.photos/412/300")!], bio: "This is my bio", age:39),
        Person(name: "Saya", imageURLS: [ URL(string: "https://picsum.photos/413/300")!], bio: "This is my bio", age:38),
        Person(name: "Saera", imageURLS: [ URL(string: "https://picsum.photos/414/300")!], bio: "This is my bio", age:37),
        Person(name: "Swerweca", imageURLS: [ URL(string: "https://picsum.photos/415/300")!], bio: "This is my bio", age:23),
        Person(name: "Werwerda", imageURLS: [ URL(string: "https://picsum.photos/416/300")!], bio: "This is my bio", age:24),
        Person(name: "Cava", imageURLS: [ URL(string: "https://picsum.photos/421/300")!], bio: "This is my bio", age:28),
        Person(name: "Xuxu", imageURLS: [ URL(string: "https://picsum.photos/422/300")!], bio: "This is my bio", age:29),
        Person(name: "Xixi", imageURLS: [ URL(string: "https://picsum.photos/423/300")!], bio: "This is my bio", age:20)
    ]
}
