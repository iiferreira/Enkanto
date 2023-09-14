//
//  ProfileSwipePromo.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 13/09/23.
//

import SwiftUI

struct ProfileSwipePromo: View {
    
    var textSpacing : CGFloat = 8
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                VStack(spacing: textSpacing) {
                    Spacer()
                    Text("Buy Enkanto Gold !")
                        .font(.headline)
                    
                    Text("See who likes you and more !")
                        .font(.subheadline)
                    
                    // Spacer()
                }
                .padding(.bottom,35)
                
                VStack(spacing:textSpacing) {
                    Spacer()
                    Text("Get Matches Faster !")
                        .font(.headline)
                    Text("See who likes you and more !")
                        .font(.subheadline)
                   
                }
                .padding(.bottom,35)
                
                VStack(spacing:textSpacing) {
                    Spacer()
                    Text("Increase your chances!")
                        .font(.headline)
                    Text("Boost your profile once a month ! !")
                        .font(.subheadline)
                }
                .padding(.bottom,35)
            }
            .tabViewStyle(PageTabViewStyle())
            Button {

            } label: {
                Text("BUY ENKANTO+")
                    .frame(width: 260,height: 50)
                    .background(.indigo)
                    .cornerRadius(9)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            Spacer()
        }
    }
}

struct ProfileSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.systemGray6).opacity(0.35)
            ProfileSwipePromo()
        }
    }
}
