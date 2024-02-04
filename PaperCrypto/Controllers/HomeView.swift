//
//  HomeView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 02/02/24.
//

import SwiftUI

struct HomeView: View {
    @State var cryptos = MockData.sharedInstance.coinData
    @State private var selectedCrypto: CoinViewData?
    var body: some View {
        VStack(alignment: .leading){
            List{
                Section {
                    HomeScreenCardView(userName: "Tushar")
                }
                .listRowSeparator(.hidden, edges: .all)
                
                
                Section(
                    header: Text("Trending Coins")
                        .font(.getFont(font: .interBold, size: 20))
                        .padding(.vertical,-5)
                ) {
                    ForEach(cryptos, id: \.self) { coin in
                        CoinView(coinData: coin)
                            .padding(.vertical,-5)
                            .onTapGesture {
                                selectedCrypto = coin
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
                tag: selectedCrypto ?? MockData.sharedInstance.coinData[0],
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
