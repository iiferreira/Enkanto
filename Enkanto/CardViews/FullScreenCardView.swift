//
//  FullScreenCardView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 03/10/23.
//

import SwiftUI

struct FullScreenCardView: View {
    
    @EnvironmentObject var userManager : UserManager
    
    var person : Person
    
    @Binding var fullScreenMode : Bool
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                VStack(spacing:0) {
                    CardImageScroller(person: person, fullScreenMode: $fullScreenMode)
                        .frame(width: screen.width, height: screen.height * 0.6)
                    
                    HStack {
                        VStack(alignment:.leading) {
                            HStack {
                                Text(person.name)
                                    .font(.system(size: 32, weight: .heavy))
                                Text(String(person.age))
                                    .font(.system(size: 28, weight: .light))
                                
                                Spacer()
                            }
                            .opacity(0.75)
                            
                            Text("\(person.distance) miles away")
                                .font(.system(size: 18, weight: .medium))
                                .opacity(0.75)
                        }
                        .padding([.horizontal,.top], 16)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.down.circle.fill")
                                .font(.system(size: 42))
                                .foregroundColor(.red)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.trailing,16)
                        .offset(y:-40)
                    }
                    
                    Spacer().frame(height: 26)
                    
                    HStack {
                        Text(person.bio)
                            .font(.system(size: 18, weight: .medium))
                            .lineLimit(20)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .opacity(0.75)
                            .padding(.horizontal,16)
                        
                        Spacer()
                    }
                    Spacer().frame(height: 32)
                    
                    VStack(spacing:24) {
                        Button {
                            showActionSheet()
                        } label: {
                            VStack {
                                Text("SHARE \(person.name.uppercased()) PROFILE")
                                Text("SEE WHAT A FRIEND THINKS")
                            }
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.red)
                            .opacity(0.9)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("REPORT \(person.name.uppercased())")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                                .opacity(0.75)
                        }
                    }
                    Spacer().frame(height: 200)
                }
            }
            HStack {
                Spacer()
                CircleButtonView(type: .no) {
                    fullScreenMode = false
                    userManager.swipe(person, .nope)
                }
                .frame(height:50)
                CircleButtonView(type: .star) {
                    fullScreenMode = false
                    userManager.superLike(person)
                }
                .frame(height: 45)
                CircleButtonView(type: .heart) {
                    fullScreenMode = false
                    userManager.swipe(person, .like)
                }
                .frame(height: 50)
                Spacer()
            }
            .padding(.top,25)
            .padding(.bottom,45)
            .edgesIgnoringSafeArea(.bottom)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.2),Color.white]),
                               startPoint: .top,
                               endPoint: .bottom)
            )
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding(.top,40)
    }
    
    func showActionSheet() {
        let items : [Any] = ["What do you thing about \(person.name) \n"]
        let av = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true)
    }
    
}

struct FullScreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCardView(person: Person.example, fullScreenMode: .constant(true))
            .environmentObject(UserManager())
    }
}
