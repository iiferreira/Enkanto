//
//  MatchesView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 20/09/23.
//

import SwiftUI

struct MatchesView: View {

    @EnvironmentObject var userManager : UserManager
    @EnvironmentObject var appState : AppStateManager
    
    @State private var selectedTab : LikedTab = .likes
    
    enum LikedTab {
        case likes
        case topPicks
    }
    
    private var buttonText: String {
        switch selectedTab {
        case .likes:
            return "See who likes you."
        case.topPicks:
            return "Unlock Top Picks"
        }
    }
    
    private func buttonAction() {
        appState.showPurchaseScreen()
    }

    var body: some View {
        ZStack(alignment:.bottom) {
            VStack(spacing: 10) {
                HStack {
                    Spacer()
                    
                    Button {
                        selectedTab = .likes
                    } label: {
                        Text("\(userManager.matches.count) Likes")
                            .font(.system(size:22, weight: .semibold))
                            .if(selectedTab == .topPicks) {
                                $0.foregroundColor(.textPrimary)
                            }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Button {
                        selectedTab = .topPicks
                    } label: {
                        Text("\(userManager.matches.count) Top Picks")
                            .font(.system(size:22, weight: .semibold))
                            .if(selectedTab == .likes) {
                                $0.foregroundColor(.textPrimary)
                            }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    

                }
               
                Divider()
                    .padding(.horizontal,20)
                
                setupView()
                
                Spacer()
            }
            
            Button {
                appState.showPurchasePopup.toggle()
            } label: {
                Text(buttonText)
                    .padding(.vertical,14)
                    .padding(.horizontal,36)
                    .font(.system(size: 22,weight: .bold))
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(30)
            }

        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}

//MARK: -Helper functions

extension MatchesView {
    func setupView() -> some View {
        switch selectedTab {
        case .likes:
            let view = LikesView()
            return AnyView(view)
        case .topPicks:
            let view = TopPicksView()
            return AnyView(view)
        }
    }
}
