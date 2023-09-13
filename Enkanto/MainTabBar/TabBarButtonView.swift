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
    var type: TabBarButtonType
    @EnvironmentObject var appState : AppStateManager
    
    //var action : () -> ()
    
    var body: some View {
        Button {
            appState.selectedTab = type
        } label: {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 38)
                .if(appState.selectedTab == type, transform: { button in
                    button.foregroundColor(type == .star ? .yellow : .red)
                })
                .foregroundColor(.gray.opacity(0.5))
        }
    }
}

