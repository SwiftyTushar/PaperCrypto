//
//  ContentView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    init(){
        UITabBar.appearance().backgroundColor = UIColor.systemGroupedBackground
        UITabBar.appearance().isTranslucent = true
    }
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            MarketsView()
                .tabItem {
                    Label("Market",systemImage: "align.vertical.bottom")
                }
            TradesView()
                .tabItem {
                    Label("Trades", systemImage: "book")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
