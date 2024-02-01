//
//  ContentView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var cryptos:[String] = ["Bitcoin","Etherium","Solana","Shiba-Inu"]
    var body: some View {
        VStack(alignment: .center){
            List{
                HomeScreenCardView(userName: "Tushar")
                    .listRowSeparator(.hidden, edges: .all)
                    .padding(.top, -20)
                    .padding(.bottom,-10)
                
                Section(
                    header: Text("Trending Coins")
                        .font(.getFont(font: .interBold, size: 20))
                        .padding(.leading,-20)
                ) {
                    ForEach(cryptos, id: \.self) { element in
                        Text(element)
                    }
                }
                .headerProminence(.increased)
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
