//
//  LikesView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 20/09/23.
//

import SwiftUI

struct LikesView: View {
    @EnvironmentObject var userManager : UserManager
    @EnvironmentObject var appStateManager : AppStateManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goldSubscriber {
                Text("Upgrade to gold to see people who already liked you.")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16,weight: .medium))
                    .padding()
                    .padding(.bottom,10)
            }
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 30, pinnedViews: []) {
                
                ForEach(userManager.matches) { person in
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

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView().environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}

//MARK: - Helper Functions

extension LikesView {
    func personTapped(_ person: Person) {
        if user.goldSubscriber {
            appStateManager.showPersonProfile(person)
        } else {
            appStateManager.showPurchaseScreen()
        }
    }
}
