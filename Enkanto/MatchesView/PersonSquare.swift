//
//  PersonSquare.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 20/09/23.
//

import SwiftUI
import Kingfisher

struct PersonSquare: View {
    var person : Person
    var blur : Bool

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment:.bottomLeading) {
                KFImage(person.imageURLS.first)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: 240)
                    .if(blur) {
                        $0.blur(radius:25)
                     }
                
                Text("\(person.name),\(person.age)")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 18,weight: .semibold))
                    .if(blur) {
                        $0.redacted(reason: .placeholder)
                    }
            }
            .cornerRadius(10)
        
        }
    }
}

struct PersonSquare_Previews: PreviewProvider {
    static var previews: some View {
        PersonSquare(person: Person.example, blur: false)
    }
}
