//
//  CardImageScroller.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 01/10/23.
//

import SwiftUI
import Kingfisher

struct CardImageScroller: View {
    
    var person : Person
    
    @State private var imageIndex : Int = 0
    
    func updateImage(addition:Bool) {
        let newIndex : Int
        
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        
        imageIndex = min(max(0, newIndex), person.imageURLS.count - 1 )
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                KFImage(person.imageURLS[imageIndex])
                    .placeholder {
                        Color.white
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.height, height: geo.size.width)
                    .clipped()
                
                HStack {
                    Rectangle()
                        .onTapGesture {
                            updateImage(addition: false)
                        }
                    
                    Rectangle()
                        .onTapGesture {
                            updateImage(addition: true)
                        }
                }
                .foregroundColor(Color.white.opacity(0.01))
            }
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example)
    }
}
