//
//  WatchListView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 10/02/24.
//

import SwiftUI

struct MarketsView: View {
    @StateObject var viewModel = MarketViewModel()
    @State private var navigateToDetails:Bool = false
    @State private var selectedCoin:Coin = MockData.sharedInstance.mockCoin
    var body: some View {
        VStack{
            HStack(alignment: .center){
                VStack(alignment: .leading){
                    Text("Markets")
                        .font(.getFont(font: .nunitoBold, size: 32))
                        
                    Text("Explore the market")
                        .foregroundStyle(.black.opacity(0.6))
                        .font(.getFont(font: .nunitoMedium, size: 12))
                }
                .padding(.leading)
                
                Spacer()
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .foregroundStyle(.black.opacity(0.8))
                    .frame(width: 20,height: 20)
                    .padding(.trailing)
            }
            .padding(.top)
            
            HStack{
                Text("Coins")
                    .font(.getFont(font: .nunitoBold, size: 22))
                    .foregroundStyle(.black)
                Spacer()
                Capsule()
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
                    .foregroundStyle(.white)
                    .frame(width: 105, height: 25)
                    .padding(.trailing)
                    .overlay {
                        HStack(spacing:5){
                            Text("Market-INR")
                                .font(.getFont(font: .nunitoSemibold, size: 12))
                                .foregroundStyle(.black)
                            Image(systemName: "chevron.down")
                                .resizable()
                                .frame(width: 10, height: 5)
                                .foregroundStyle(.gray)
                                .padding(.trailing)
                        }
                        
                    }
            }
            .padding(.leading)
            VStack(spacing:0){
                MarketCoinHeaderView(selectedIndex: Binding(
                    get: { viewModel.selectedSegmentIndex },
                    set: {
                        viewModel.selectedSegmentIndex = $0
                        viewModel.filterCoins()
                    }
                ))
                
                Color.appColorBorderGray
                    .frame(height: 0.5)
                    .padding(.top,-6)
            }
            
            Spacer()
            List{
                ForEach(viewModel.coins){ coin in
                    CoinView(coinData: coin)
                        .listRowSeparator(.hidden)
                        .padding([.vertical,.horizontal],-5)
                        .onTapGesture {
                            print("onTap--")
                            selectedCoin = coin
                            navigateToDetails = true
                        }
                }

            }
            .listStyle(.plain)
        }
        .onAppear(perform: {
            viewModel.fetchAllCoins()
        })
        .navigationDestination(isPresented: $navigateToDetails) {
            //CoinDetailsView(symbol: selectedCoin)
            PlaceOrdersView(coin: selectedCoin)
        }
    }
}

#Preview {
    MarketsView()
}
