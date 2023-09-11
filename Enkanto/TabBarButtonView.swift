//
//  TabBarButtonView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 11/09/23.
//

import SwiftUI

enum TabBarButtonType : String {
    
    case fire = "flame.fill"
    case star = "star.fill"
    case message = "message.fill"
    case profile = "person.fill"

}

struct TabBarButtonView: View {
    var action : () -> ()
    
    var type: TabBarButtonType
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray.opacity(0.5))
        }
    }
}

struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonView(action: {
            print("Hello")
        }, type: .fire)
    }
}
