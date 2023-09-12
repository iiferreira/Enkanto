//
//  MainView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 11/09/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var appState : AppStateManager
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(spacing:45) {
                    TabBarButtonView(type: .fire)
                    
                    TabBarButtonView(type: .star)
                    
                    TabBarButtonView(type: .message)
                    
                    TabBarButtonView(type: .profile)
                    
                }
                .frame(height: 50)
                .padding(.horizontal, 15)
                
                Spacer()
                
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

