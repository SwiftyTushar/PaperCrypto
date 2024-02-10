//
//  TradeHistoryView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 03/02/24.
//

import SwiftUI

struct TradeHistoryView: View {
    @State var cryptos = [MockData.sharedInstance.mockCoin]
    var body: some View {
        List{
            ForEach(cryptos) { coin in
                CoinView(coinData: coin)
                    .padding(.vertical,-5)
                    .onTapGesture {
                        //selectedCrypto = coin
                    }
                .listRowSeparator(.hidden, edges: .all)
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .background(.white)
    }
}

struct TradeHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TradeHistoryView()
    }
}
