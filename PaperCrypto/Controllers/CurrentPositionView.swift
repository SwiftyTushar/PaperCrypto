//
//  CurrentPositionView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 03/02/24.
//

import SwiftUI

struct CurrentPositionView: View {
    @State var coinData:[CoinViewData] = MockData.sharedInstance.coinData
    var body: some View {
        ScrollView{
            VStack{
                Text("+₹ 2000.23")
                    .foregroundColor(.green)
                    .font(.getFont(font: .interBold, size: 20))
                Text("Total P&L")
                    .font(.getFont(font: .interMedium, size: 16))
                    .foregroundColor(.gray)
                ForEach(coinData, id: \.self){ coinData in
                    CoinView(coinData:coinData)
                        .padding(.horizontal,20)
                }
            }
            .padding(.top,16)
        }
        .refreshable {
            print("Refreshed")
        }
        .scrollIndicators(.hidden)
    }
}

struct CurrentPositionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentPositionView()
    }
}
