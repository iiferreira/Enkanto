//
//  CardStack.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 04/10/23.
//

import SwiftUI

struct CardStack: View {
    
    var people : [Person]
    
    @State private var fullscreenMode : Bool = false
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            ForEach(people) { person in
                CardView(person: person, fullScreenMode: $fullscreenMode)
            }
        }
        .frame(width: screen.width, height: fullscreenMode ? screen.height : 550)
    }
}

#Preview {
    CardStack(people: Person.examples)
}
