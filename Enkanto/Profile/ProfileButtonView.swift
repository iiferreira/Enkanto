//
//  ProfileButtonView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 13/09/23.
//

import SwiftUI

struct ProfileButtonView: View {
    var title: String!
    var image: String!
    var atEvidence : Bool = false
    var action: ()->()
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: image)
                    .foregroundColor(atEvidence ? .white : .textPrimary)
                    .font(.system(size: 30))
                    .padding(atEvidence ? 25 : 10)
                    .background(atEvidence ? .red : .white )
                    .clipShape(Circle())
                    .shadow(radius: 6)
                
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.textSecondary)
            }
        }
    }
}

struct ProfileButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtonView(title: "Hello", image: "circle.fill" ,atEvidence: true) {
            print("Hello")
        }
    }
}
