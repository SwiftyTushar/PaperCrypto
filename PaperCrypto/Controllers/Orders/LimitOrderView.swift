//
//  LimitOrderView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 18/02/24.
//

import SwiftUI

struct LimitOrderView: View {
    var selectedOrderType:OrderType
    var coin:Coin
    @Binding var entryPrice:String
    @Binding var stopLoss:String
    @Binding var targetPrice:String
    @Binding var inRupees:String
    
    var body: some View {
        VStack(spacing:5){
            Text("ESTIMATED \(selectedOrderType == .buy ? "BUYING" : "SELLING") PRICE")
                .font(.getFont(font: .nunitoBold, size: 12))
                .foregroundStyle(.gray)
            Text(MockData.sharedInstance.mockCoin.last)
                .font(.getFont(font: .nunitoMedium, size: 18))
            HStack(spacing:5){
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.4))
                    .frame(height: 1)
                Text("How much do you want to \(selectedOrderType.rawValue)?")
                    .lineLimit(1)
                    .font(.getFont(font: .nunitoSemibold, size: 15))
                    .foregroundStyle(.black.opacity(0.8))
                    .fixedSize(horizontal: true, vertical: false)
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.4))
                    .frame(height: 1)
            }
            
            HStack{
                PCTextField(placeHolder: "In Rupees", text: $inRupees, keyboardType: .numberPad,shouldHideLeadingImage: true)
                Text("=")
                    .fontWeight(.bold)
                PCTextField(placeHolder: "In \(coin.symbol.uppercased())", text: $stopLoss, keyboardType: .numberPad,shouldHideLeadingImage: true)
            }
            .padding()
            HStack(spacing:5){
                Text("Balance:")
                    .font(.getFont(font: .nunitoRegular, size: 14))
                    .foregroundStyle(.gray)
                Text("$100")
                    .font(.getFont(font: .nunitoSemibold, size: 14))
                Spacer()
            }
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    LimitOrderView(selectedOrderType: .buy, coin: MockData.sharedInstance.mockCoin, entryPrice: .constant(""), stopLoss: .constant(""), targetPrice: .constant(""),inRupees: .constant(""))
}
