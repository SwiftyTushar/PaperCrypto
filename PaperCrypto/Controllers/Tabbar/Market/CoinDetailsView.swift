//
//  BuySellCoinView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 02/02/24.
//

import SwiftUI
import Charts

struct ValuePerCategory {
    var category: String
    var value: Double
}


let data: [ValuePerCategory] = [
    .init(category: "A", value: 300),
    .init(category: "B", value: 200),
    .init(category: "C", value: 400),
    .init(category: "D", value: 560),
    .init(category: "E", value: 1000),
    .init(category: "F", value: 950),
    .init(category: "G", value: 300),
    .init(category: "H", value: 200),
    .init(category: "I", value: 400),
    .init(category: "J", value: 560),
    .init(category: "K", value: 1000),
    .init(category: "L", value: 950)
]

struct CoinDetailsView: View {
    public var selectedSymbol:Coin
    private let chartTimeStamps = ["1 H","24 H","1 W","1 M","6 M","1 Y","All"]
    @State private var selectedTimeStamp = "1 H"
    @StateObject private var viewModel = CoinDetailViewModel()
    
    init(symbol:Coin) {
        selectedSymbol = symbol
    }
    var body: some View {
        VStack(alignment:.leading,spacing: 8){
            CryptoHeaderView(coin: selectedSymbol)
            HStack{
                Spacer()
                    .frame(width: 20)
                Text(" \(Float(selectedSymbol.last)!.amountWithCurrency(currency: "₹"))")
                    .font(.getFont(font: .interMedium, size: 16))
                Text("\(selectedSymbol.percentageChange > 0 ? "+" : "")\(String(format: "%.2f", selectedSymbol.percentageChange))%")
                    .font(.getFont(font: .interMedium, size: 12))
                    .foregroundColor(selectedSymbol.percentageChange > 0 ? .green : .red)
            }
            Spacer()
                .frame(height: 20)
           
            Spacer()
            BuySellView()
        }
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            print("")
        }
    }
}

#Preview {
    CoinDetailsView(symbol: MockData.sharedInstance.mockCoin)
}
