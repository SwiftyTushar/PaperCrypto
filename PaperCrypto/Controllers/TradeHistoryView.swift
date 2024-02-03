//
//  TradeHistoryView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 03/02/24.
//

import SwiftUI

struct TradeHistoryView: View {
    var body: some View {
        List{
            ForEach(0..<10){ _ in
                CoinView()
                    .background(.white)
                    .listRowSeparator(.hidden)
                    .padding(.vertical,-5)
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
