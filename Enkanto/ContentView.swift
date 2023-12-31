//
//  ContentView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var manager : AppStateManager = AppStateManager()
    @ObservedObject var userManager : UserManager = UserManager()
    
    var body: some View {
        MainView()
            .environmentObject(manager)
            .environmentObject(userManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
