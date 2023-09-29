//
//  Subscription.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 28/09/23.
//

import Foundation

struct Subscription : Identifiable {
    let id = UUID()
    
    var month: Int
    var monthlyCost : Double
    var totalCost : Double
    var savePercent : Int?
    var tagLine : TagLine = .none
    
    var monthlySubscriptionText : String {
        return "$\(String(format:"%.2f", monthlyCost))/mo"
    }
    
    var totalCostString : String {
        return "$\(String(format:"%.2f", totalCost))/mo"
    }
    
    enum TagLine : String {
        case mostPopular = "MOST POPULAR"
        case bestValue =  "BEST VALUE"
        case none
    }
}

extension Subscription {
    static let example1 = Subscription(month: 6,
                                       monthlyCost: 15.99,
                                       totalCost: 89.99,
                                       savePercent: 3,
                                       tagLine: .mostPopular)
    
    static let example2 = Subscription(month: 3,
                                      monthlyCost: 19.99,
                                      totalCost: 59.99,
                                      savePercent: 5,
                                      tagLine: .bestValue)
    
    static let example3 = Subscription(month: 1,
                                       monthlyCost: 29.99,
                                      totalCost: 29.99)
    
}
