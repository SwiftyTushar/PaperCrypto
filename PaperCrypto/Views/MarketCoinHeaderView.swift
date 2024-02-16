//
//  MarketCoinHeaderView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 12/02/24.
//

import SwiftUI

struct MarketCoinHeaderView: View {
    @Binding var selectedIndex:Int
    var body: some View {
        HStack(spacing: 20){
            MarketButtonView(title: "All",selected: selectedIndex == 0)
                .onTapGesture {
                    selectedIndex = 0
                }
            MarketButtonView(title: "Gainer",selected: selectedIndex == 1)
                .onTapGesture {
                    selectedIndex = 1
                }
            MarketButtonView(title: "Loser",selected: selectedIndex == 2)
                .onTapGesture {
                    selectedIndex = 2
                }
            MarketButtonView(title: "Favourite",selected: selectedIndex == 3)
                .onTapGesture {
                    selectedIndex = 3
                }
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

#Preview {
    MarketCoinHeaderView(selectedIndex: .constant(0))
}
