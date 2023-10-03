//
//  FullScreenCardView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 02/10/23.
//

import SwiftUI

struct FullScreenCardView: View {
    
    let screen = UIScreen.main.bounds
    var person : Person
    
    @Binding var fullScreenMode : Bool
    
    var body: some View {
        ScrollView(showsIndicators: false ) {
            VStack {
                CardImageScroller(person: person, fullScreenMode: $fullScreenMode)
                    .frame(width: screen.width, height: screen.height * 0.6)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack{
                            Text(person.name)
                                .font(.system(size: 32, weight: .heavy))
                            Text("\(person.age)")
                                .font(.system(size: 28, weight: .light))
                            Spacer()
                        }
                        .opacity(0.75)
                        
                        Text("\(person.distance) miles away")
                        
                        HStack {
                            Text(person.bio)
                                .font(.system(size: 18, weight: .medium))
                                .multilineTextAlignment(.leading)
                                .lineLimit(20)
                                .fixedSize(horizontal: false, vertical: true)
                                .opacity(0.7)
                        }
                        .padding(.top,10)
                        .padding(.horizontal,10)
                        
                    }
                    Button(action: {}, label: {
                        Image(systemName: "arrow.down.circle.fill")
                            .renderingMode(.template)
                            .foregroundStyle(Color.red)
                            .background(Color.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 42))
                    })
                    .offset(y:-65)
                }
            }
        }
    }
}

struct FullScreenCardView_Preview: PreviewProvider {
    static var previews: some View {
        FullScreenCardView(person: Person.example, fullScreenMode: .constant(true))
    }
}
