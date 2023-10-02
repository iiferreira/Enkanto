//
//  MainView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 11/09/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var appState : AppStateManager
    
    func correctViewForState() -> some View {
        switch appState.selectedTab {
        case .fire:
            let view = Text("oi")
            return AnyView(view)
        case .some(.star):
            let view = MatchesView()
            return AnyView(view)
        case .some(.message):
            let view = MessageListView()
            return AnyView(view)
        case .some(.profile):
            let view = ProfileView()
            return AnyView(view)
        case .none:
            let view = Color(.systemGray6).opacity(0.35)
            return AnyView(view)
        }
    }
    
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
                
                correctViewForState()
                
                Spacer()
                
            }
            .edgesIgnoringSafeArea(.vertical)
            
            if appState.showPurchasePopup {
                PurchasePopup(isVisible: $appState.showPurchasePopup)
                    .animation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.5))
                    .transition(.move(edge: .bottom))
            }
        }
        .modifier(HideNavigationView())
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}


