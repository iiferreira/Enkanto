//
//  ProfileView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 13/09/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userManager : UserManager
    @EnvironmentObject var appState : AppStateManager
    
    var user : User {
        return userManager.currentUser
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6).opacity(0.65)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack(alignment: .topTrailing) {
                    RoundedImage(url: user.imageURL.first)
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
                
                Text("\(user.name),\(user.age)")
                    .foregroundColor(.textTitle)
                    .font(.system(size: 26,weight: .medium))
                
                Text("\(user.jobTitle)")
                    .padding(.all,5)
                
                HStack {
                    VStack {
                        HStack(alignment:.top, spacing:25) {
                            ProfileButtonView(title: "SETTINGS", image: "gearshape.fill") {
                                
                            }
                            
                            ProfileButtonView(title: "ADD MEDIA", image: "camera.fill", atEvidence: true) {
                                
                            }
                            
                            ProfileButtonView(title: "SAFETY", image: "shield.fill") {
                                
                            }
                        }
                        .padding(.top,20)
                    }
                }
                
                HStack {
                    Text("\(user.profileTip)")
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.pink)
                            .padding(6)
                    }
                    .background(.white)
                    .clipShape(Circle())
                }
                .frame(height: 34, alignment: .center)
                .padding()
                .background(.pink)
                .cornerRadius(12)
                
                if !user.goldSubscriber {
                    ZStack {
                        ProfileSwipePromo {
                            appState.showPurchaseScreen()
                        }
                        .background(.gray.opacity(0.10))
                        .cornerRadius(12)
                        .padding()
                    }
                }
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}


