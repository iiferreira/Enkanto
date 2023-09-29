//
//  PurchasesOptionsView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 28/09/23.
//

import SwiftUI

struct PurchasesOptionsView: View {
    var subscription: Subscription
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Text("\(subscription.month)")
                .font(.system(size: 44,weight: .light))
            
            Spacer().frame(height: 2)
            
            Text("month\(subscription.month > 1 ? "s" : "")")
                .if(isSelected) {
                    $0.font(.system(size: 14, weight: .bold))
                }
            
            Spacer().frame(height: 2)
            
            Text(subscription.monthlySubscriptionText)
                .foregroundColor(.textPrimary)
            
            Spacer().frame(height: 10)
            
            if subscription.savePercent != nil {
                Text("SAVE \(subscription.savePercent ?? 0)%")
                    .foregroundColor(.yellow)
                    .font(.system(size: 18, weight: .heavy))
                    .frame(height: 22)
            } else {
                Spacer().frame(height: 22)
            }
            
            Text(subscription.totalCostString)
                .font(.system(size: 22, weight: .bold))
        }
        .padding(.horizontal,12)
        .padding(.vertical,18)
        .if(!isSelected) {
            $0.foregroundColor(.textPrimary)
        }
        .if(isSelected && subscription.tagLine == .none) {
            $0.overlay {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.yellow, lineWidth: 1.5)
                    .padding(.all, -2)
            }
        }
        .if(isSelected && subscription.tagLine != .none) {
            $0.overlay {
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(height: 20)
                    
                    Text(subscription.tagLine.rawValue)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.top,2)
                        .padding(.horizontal,6)
                        .minimumScaleFactor(0.1)
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.yellow, lineWidth: 1.5)
                
                }
            }
        }
    }
}

struct PurchasesOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            PurchasesOptionsView(subscription: .example1, isSelected: false)
            PurchasesOptionsView(subscription: .example2, isSelected: true)
            PurchasesOptionsView(subscription: .example3, isSelected: false)
        }
    }
}
