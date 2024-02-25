//
//  TradeHistoryView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 03/02/24.
//

import SwiftUI

struct TradeHistoryView: View {
    var orders:[Order?] = []
    
    var body: some View {
        Text("Hello World")
//        List{
//            ForEach(orders.compactMap($0)) { order in
//                CoinView(coinData: MockData.sharedInstance.mockCoin)
//            }
//        }
//        .listStyle(.plain)
//        .background(.white)
    }
}

struct TradeHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TradeHistoryView()
    }
}
