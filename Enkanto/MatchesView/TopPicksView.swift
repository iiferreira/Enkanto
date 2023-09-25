//
//  LikesView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 20/09/23.
//

import SwiftUI

struct TopPicksView: View {
    @EnvironmentObject var userManager : UserManager
    @EnvironmentObject var appStateManager : AppStateManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goldSubscriber {
                Text("Upgrade fore more Top Picks.")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16,weight: .medium))
                    .padding()
                    .padding(.bottom,10)
            }
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 30, pinnedViews: []) {
                
                ForEach(userManager.topPicks) { person in
                    PersonSquare(person: person, blur: !user.goldSubscriber)
                        .frame(height: 240)
                        .onTapGesture {
                            personTapped(person)
                        }
                }
            }
            .padding()
        }
    }
}

struct TopLikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView().environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}

//MARK: - Helper Functions

extension TopPicksView {
    func personTapped(_ person: Person) {
        if user.goldSubscriber {
            appStateManager.showPersonProfile(person)
        } else {
            appStateManager.showPurchaseScreen()
        }
    }
}
