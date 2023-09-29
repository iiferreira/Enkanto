//
//  PurchasePopup.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 25/09/23.
//

import SwiftUI

struct PurchasePopup: View {
    
    var screen = UIScreen.main.bounds
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                Spacer().frame(height: 40)
                
                VStack {
                    
                    Text("Get Enkanto Gold")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24,weight: .bold))
                    
                    PurchasesSwipePromo()
                        .frame(height: geo.size.height / 3 )
                        .padding(.top, -35)
                        
                    
                    Text("3 Purchase Options")
                    
                    Button {
                        processPayment()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 45)
                                .foregroundColor(.yellow)
                            
                            Text("CONTINUE")
                                .foregroundColor(.white)
                                .font(.system(size: 20,weight: .heavy))
                        }
                    }
                    .frame(height: 55)
                    .padding()
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Text("NO THANKS")
                                .foregroundColor(.gray)
                                .font(.system(size: 20,weight: .heavy))
                        }
                    }
                    .frame(height: 55)
                    .padding(.horizontal,24)
                    .padding(.top,12)
                    
                }
                .frame(width: geo.size.width)
                .background(
                    RoundedRectangle(cornerRadius: 25,style: .continuous)
                        .foregroundColor(.white)
                )
                .padding(.vertical,12)
                
                Spacer()
                
                VStack {
                    Text("Bla bla bla bla bla")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                    Text("This is a bund of example text that is represntaing the legal text found on all subscription text")
                        .foregroundColor(Color.white.opacity(0.5))
                        .font(.system(size: 14,weight: .semibold))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
               
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
        .frame(height: screen.height)
    }
}

struct PurchasePopup_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopup()
    }
}


//MARK: - Helper functions

extension PurchasePopup {
    
    func processPayment() {
        print("Pimba")
    }
}
