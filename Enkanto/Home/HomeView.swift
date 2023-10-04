//
//  HomeView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 04/10/23.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var userManager : UserManager
    @EnvironmentObject var appState : AppStateManager

    var body: some View {
        VStack {
            CardStack(people: userManager.cardPeople)
            
            Spacer()
            
            HStack(spacing:15) {
                CircleButtonView(type: .back) {
                    appState.showPurchaseScreen()
                }
                
                CircleButtonView(type: .no) {
                    if let person = userManager.cardPeople.last {
                        userManager.swipe(person, .nope)
                    }
                }
                
                CircleButtonView(type: .star) {
                    if let person = userManager.cardPeople.last {
                        if userManager.currentUser.goldSubscriber {
                            userManager.superLike(person)
                        } else {
                            appState.showPurchaseScreen()
                        }
                    }
                }
                
                CircleButtonView(type: .heart) {
                    if let person = userManager.cardPeople.last {
                        userManager.swipe(person, .like)
                    }
                }
                
                CircleButtonView(type: .lightning) {
                    appState.showPurchaseScreen()
                }
            }
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.vertical,25)
                
            Spacer()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(UserManager())
        .environmentObject(AppStateManager() )
}
