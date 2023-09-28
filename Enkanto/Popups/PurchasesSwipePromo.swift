//
//  PurchasesSwipePromo.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 28/09/23.
//

import SwiftUI

struct PurchasesSwipePromo: View {
    var body: some View {
        TabView {
            BenefitView(image: "thermometer.sun.fill",
                        title: "25 already like you!",
                        text: "Match tem instantly")
            
            BenefitView(image: "paperplane.circle.fill",
                        title: "25 already like you!",
                        text: "Match tem instantly")
            
            BenefitView(image: "calendar.badge.plus",
                        title: "25 already like you!",
                        text: "Match tem instantly")

        }
        .tabViewStyle(.page)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct PurchasesSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        PurchasesSwipePromo()
            .frame(height: UIScreen.main.bounds.height / 3)
    }
}

struct BenefitView: View {
    
    var image : String
    var title : String
    var text  : String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 75)
            
            Text("25 people already like you!")
                .font(.system(size: 18, weight: .semibold))
            
            Text("Match them instantly")
                //.padding(.bottom,20)
        }
    }
}
