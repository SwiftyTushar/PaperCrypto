//
//  HomeView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 02/02/24.
//

import SwiftUI

struct HomeView: View {
    var cryptos:[String] = ["Bitcoin","Etherium","Solana","Shiba-Inu"]
    var body: some View {
        VStack(alignment: .center){
            List{
                Section {
                    HomeScreenCardView(userName: "Tushar")
                        .listRowSeparator(.hidden, edges: .all)
                }
                Section(
                    header: Text("Trending Coins")
                        .font(.getFont(font: .interBold, size: 20))
                ) {
                    ForEach(cryptos, id: \.self) { element in
                        CoinView()
                            .listRowSeparator(.hidden, edges: .all)
                    }
                    .listRowBackground(Color.clear)
                }
                .headerProminence(.increased)
            }
            .listStyle(.plain)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
