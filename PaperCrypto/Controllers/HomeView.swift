//
//  HomeView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 02/02/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCoin: Coin?
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            List{
                Section {
                    HomeScreenCardView(userName: "Tushar")
                }
                .listRowSeparator(.hidden, edges: .all)
                
                Section{
                    Text("Trending Coins")
                        .font(.getFont(font: .interBold, size: 20))
                        .padding(.vertical,-5)
                        .listRowSeparator(.hidden)
                }
                Section{
                    ForEach(viewModel.trendingCoins) { coin in
                        CoinView(coinData: coin)
                            .padding(.vertical,-5)
                            .onTapGesture {
                                selectedCoin = coin
                            }
                        .listRowSeparator(.hidden, edges: .all)
                    }
                    .listRowBackground(Color.clear)
                }
//                Section(
//                    header:
//                ) {
//                    
//                }
                .headerProminence(.increased)
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
        }
        .refreshable {
            viewModel.fetchTrendingCoins()
        }
        .navigationTitle("Home")
        .onAppear(perform: {
            viewModel.fetchTrendingCoins()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
