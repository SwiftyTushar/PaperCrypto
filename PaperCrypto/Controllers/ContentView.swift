//
//  ContentView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var orderPlaced:Bool = false
    @State var selectedIndex = 0
    init(){
        UITabBar.appearance().backgroundColor = UIColor.systemGroupedBackground
        UITabBar.appearance().isTranslucent = true
    }
    
    var body: some View {
        TabView(selection:$selectedIndex) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            MarketsView(orderPlaced: $orderPlaced)
                .tabItem {
                    Label("Market",systemImage: "align.vertical.bottom")
                }
                .tag(1)
            TradesView()
                .tabItem {
                    Label("Trades", systemImage: "book")
                }
                .tag(2)
        }
        .onChange(of: orderPlaced) { _ in
            if orderPlaced{
                selectedIndex = 2
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
