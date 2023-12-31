//
//  ChatViewHeader.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 14/09/23.
//

import SwiftUI

struct ChatViewHeader: View {
    @Environment(\.presentationMode) var presentationMode
    
    let name: String
    let imageURL: URL?
    let videoAction: () -> Void
    
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
                .shadow(radius: 3)
            
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.textPrimary)
                        .font(.system(size: 28, weight: .semibold))
                }
                
                Spacer()
                
                VStack(spacing: 0) {
                    RoundedImage(url: imageURL)
                        .frame(height: 50)
                    
                    Text(name)
                        .foregroundColor(Color.textSecondary)
                        .font(.system(size: 14))
                }
                
                Spacer()
                
                Button {
                    videoAction()
                } label: {
                    Image(systemName: "video.fill")
                        .font(.system(size: 20,weight: .bold))
                }

            }
            .padding(.horizontal,22)
            .padding(.vertical,10)
        }
        .frame(height: 50)
    }
}

struct ChatViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ChatViewHeader(name: Person.example.name,
                       imageURL: Person.example.imageURLS[0],
                       videoAction: { print("A") })
    }
}
