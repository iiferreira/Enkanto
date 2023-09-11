//
//  MainView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 11/09/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(spacing:45) {
                    TabBarButtonView(action: {
                        print("flame")
                    }, type: .fire)
                    
                    TabBarButtonView(action: {
                        print("flame")
                    }, type: .star)
                    
                    TabBarButtonView(action: {
                        print("flame")
                    }, type: .message)
                    
                    TabBarButtonView(action: {
                        print("flame")
                    }, type: .profile)
                    
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


