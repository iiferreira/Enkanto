//
//  CardImageScroller.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 04/10/23.
//

import SwiftUI
import Kingfisher

struct CardImageScroller: View {
    
    var person : Person
    
    @State private var imageIndex : Int = 0
    @Binding var fullScreenMode : Bool
    
    func updateImageIndex(addition: Bool) {
        let newIndex : Int
        
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        
        imageIndex = min(max(0, newIndex), person.imageURLS.count - 1)
    }
    
    let screenCutOff = (UIScreen.main.bounds.width / 2) * 0.4
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack {
                    KFImage(person.imageURLS[imageIndex])
                        .placeholder {
                            Color.white
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                    
                    VStack {
                        HStack {
                            Image("likeButtonImg")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .opacity(Double(person.x / screenCutOff) - 1)
                            Spacer()
                            
                            Image("nopeButtonImg")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .opacity(Double(person.x / screenCutOff * -1 - 1))
                        }
                        Spacer()
                    }
                    
                    HStack {
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: false)
                            }
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: true)
                            }
                    }
                    .foregroundColor(Color.white.opacity(0.01))
                } //ZSTACK
                
                VStack {
                    HStack {
                        ForEach(0..<person.imageURLS.count) { imageIndex in
                                RoundedRectangle(cornerRadius: 20)
                                .frame(height:4)
                                .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray.opacity(0.5))
                            
                        }
                    }
                    .padding(.top,6)
                    .padding(.horizontal, fullScreenMode ? 0 : 12)
                    
                    Spacer()
                    
                    if !fullScreenMode {
                        HStack {
                            VStack {
                                HStack {
                                    Text(person.name)
                                        .font(.system(size: 32, weight: .heavy))
                                    
                                    
                                    Text(String(person.age))
                                        .font(.system(size: 28, weight: .light))
                                }
                                Text(person.bio)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(2)
                            }
                            Spacer()
                            
                            Button(action: { fullScreenMode = true }, label: {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 26, weight: .medium))
                                    .foregroundColor(.white)
                            })
                        }
                        .padding(16)
                    }
                }
                .foregroundColor(Color.white)
            }
            .cornerRadius(6)
            .shadow(radius: 5)
        }
    }
}

#Preview {
    CardImageScroller(person: Person.example, fullScreenMode: .constant(false))
}
