//
//  CardView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 02/10/23.
//

import SwiftUI

struct CardView: View {
    
    var viewAnimation : Bool = false
    
    @State var person : Person
    
    @Binding var fullScreenMode : Bool

    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.8
    
    @Namespace var imageNamespace
    
    var body: some View {
        GeometryReader { geo in
            if fullScreenMode {
                FullScreenCardView(person: person, fullScreenMode: $fullScreenMode, nameSpace: imageNamespace)
                    .animation(.easeOut(duration: 0.2))
            } else {
                CardImageScroller(person: person,fullScreenMode: $fullScreenMode)
                    .animation(.easeOut(duration: 0.2))
                    .frame(width: geo.size.width - 20, height: geo.size.height, alignment: .center)
                    .padding(.leading, 10)
                    .matchedGeometryEffect(id: "image\(person.id)", in: imageNamespace)
                    .offset(x: person.x, y: person.y)
                    .rotationEffect(.degrees(person.degree))
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.default) {
                                    person.x = value.translation.width
                                    person.y = value.translation.height
                                    withAnimation {
                                        person.degree = Double((value.translation.width / 25) * -1)
                                    }
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 10, initialVelocity: 0)) {
                                    let width = value.translation.width
                                    
                                    if width >= 0 && width <= screenCutoff {
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    } else if width <= 0 && width >= -screenCutoff {
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    } else if width > screenCutoff {
                                        // swipe right
                                        person.x = 500
                                        person.degree = 12
                                    } else if width >  -screenCutoff {
                                        //swipe lft
                                        person.x = -500
                                        person.degree = -12
                                    }
                                }
                            })
                    )
            }
        }
    }
}

struct CardView_Preview: PreviewProvider {
    static var previews: some View {
        CardView(person: Person.example, fullScreenMode: .constant(false))
        CardView(person: Person.example, fullScreenMode: .constant(true))
    }
}

