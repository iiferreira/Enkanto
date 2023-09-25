//
//  AppStageManager.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 12/09/23.
//

import Foundation

class AppStateManager : ObservableObject {
    @Published var selectedTab : TabBarButtonType?
    @Published var showPersonProfile : Person? = nil
    @Published var showPurchasePopup : Bool = false
    
    public func showPersonProfile(_ person : Person) {
        self.showPersonProfile = person
    }
    
    public func showPurchaseScreen() {
        self.showPurchasePopup = true
    }
}
