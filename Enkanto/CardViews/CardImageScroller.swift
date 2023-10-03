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
    
    @Binding var fullScreenMode : Bool
    
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
                // .frame(width: geo.size.height, height: geo.size.width)
                //.clipped()
                
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
            
            VStack {
                HStack {
                    ForEach(0..<person.imageURLS.count) { imageIndex in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 4)
                            .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray)
                    }
                }
                .padding(.top, 6)
                .padding(.horizontal, fullScreenMode ? 0 : 12)
                
                Spacer()
                
                if !fullScreenMode {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(person.name)
                                    .font(.system(size: 32, weight: .heavy))
                                
                                Text(",\(person.age)")
                                    .font(.system(size: 28, weight: .light))
                            }
                            
                            Text(person.bio)
                        }
                        .padding()
                        
                        Spacer()
                        
                        Button(action: {
                            fullScreenMode = true
                        }, label: {
                            Image(systemName: "info.circle.fill")
                                .renderingMode(.template)
                                .font(.system(size: 26, weight: .medium))
                        })
                        
                    }
                    .foregroundColor(.white)
                }
            }
        }
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 5)
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example, fullScreenMode: .constant(true))
    }
}
