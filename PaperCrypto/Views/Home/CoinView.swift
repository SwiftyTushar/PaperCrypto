//
//  CoinView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI

struct CoinView: View {
    @State var coinData:Coin
    var body: some View {
        GeometryReader(content: { geometry in
            RoundedRectangle(cornerRadius:10)
                .frame(width: geometry.size.width)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.5), radius: 1,x:0,y:0)
                .overlay {
                    HStack(spacing: 16){
                        Spacer()
                            .frame(width: 0)
                        Image(coinData.symbol)
                            .resizable()
                            .frame(width: 40,height: 40)
                        VStack(alignment: .leading){
                            HStack{
                                Text(coinData.name)
                                    .font(.getFont(font: .interMedium, size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                                Text(" \(Float(coinData.last)!.amountWithCurrency(currency: "₹"))")
                                    .font(.getFont(font: .interMedium, size: 16))
                                    .foregroundColor(.black.opacity(0.8))
                            }
                            HStack{
                                Text(coinData.symbol.uppercased())
                                    .font(.getFont(font: .interMedium, size: 14))
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("\(coinData.percentageChange > 0 ? "+" : "")\(String(format: "%.2f", coinData.percentageChange))%")
                                
                                    .font(.getFont(font: .interMedium, size: 12))
                                    .foregroundColor(coinData.percentageChange > 0 ? .green : .red)
                            }
                        }
                        Spacer()
                    }
                }
        })
        .frame(height: 70)
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(coinData: MockData.sharedInstance.mockCoin)
            .padding()
    }
}
