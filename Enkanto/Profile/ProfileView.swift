//
//  ProfileView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 13/09/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                RoundedImage(url: URL(string: "https://picsum.photos/400"))
                    .frame(height: 200)
                
                Button {
                    print("Edit")
                } label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 18,weight: .heavy))
                        .foregroundColor(Color.gray.opacity(0.5))
                        .frame(width: 32, height: 32)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                        .offset(x:-15)
                }

            }
           
            Text("Iuri Ferreira,39")
                .foregroundColor(.textTitle)
                .font(.system(size: 26,weight: .medium))
            
            Text("Software Engineer")
                .padding(.all,5)
            
            HStack {
                VStack {
                    HStack(spacing:25) {
                        ProfileButtonView(title: "SETTINGS", image: "gearshape.fill") {
                            
                        }
                        
                        ProfileButtonView(title: "CAMERA", image: "camera.fill") {
                            
                        }
                        
                        ProfileButtonView(title: "SAFETY", image: "shield.fill") {
                            
                        }
                    }
                    .padding(.top,20)
                }
            }
            
            Spacer()
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileButtonView: View {
    var title: String!
    var image: String!
    var action: ()->()
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: image)
                    .foregroundColor(.textPrimary)
                    .font(.system(size: 30))
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 6)
                
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.textSecondary)
            }
        }
    }
}
