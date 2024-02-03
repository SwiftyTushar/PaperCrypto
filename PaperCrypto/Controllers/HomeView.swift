//
//  HomeView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 02/02/24.
//

import SwiftUI

struct HomeView: View {
    var cryptos:[String] = ["Bitcoin","Etherium","Solana","Shiba-Inu"]
    @State private var selectedCrypto: String?
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
                    ForEach(cryptos, id: \.self) { crypto in
                        CoinView()
                            .onTapGesture {
                                selectedCrypto = crypto
                            }
                        .listRowSeparator(.hidden, edges: .all)
                    }
                    .listRowBackground(Color.clear)
                }
                .headerProminence(.increased)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Home")
        .background(
            NavigationLink(
                destination: CoinDetailsView(),
                tag: selectedCrypto ?? "",
                selection: $selectedCrypto
            ) {
                EmptyView()
            }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
