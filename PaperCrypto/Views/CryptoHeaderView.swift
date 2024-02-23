//
//  CryptoHeaderView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 02/02/24.
//

import SwiftUI

struct CryptoHeaderView: View {
    @Environment(\.dismiss) private var dismiss
    var coin:Coin
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(height: 60)
            .overlay {
                HStack(spacing: 12){
                    Image(systemName: "chevron.left")
                        .frame(width: 30,height: 30)
                        .onTapGesture {
                            dismiss()
                        }
                    Image(coin.symbol)
                        .resizable()
                        .frame(width: 30,height: 30)
                    Text(coin.name)
                        .font(.getFont(font: .interMedium, size: 16))
                    Text("(\(coin.symbol))")
                        .font(.getFont(font: .interMedium, size: 12))
                        .foregroundColor(.gray.opacity(0.7))
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                    Spacer()
//                    Label {
//                        Text("Exchange")
//                            .font(.getFont(font: .interMedium, size: 12))
//                            .foregroundColor(.blue)
//                    } icon: {
//                        Image("icExchange")
//                            .resizable()
//                            .frame(width: 20,height: 20)
//                    }
//                    .padding(.all,8)
//                    .background(.blue.opacity(0.2))
//                    .cornerRadius(20)
                    Spacer()
                        .frame(width: 0)
                }
            }
    }
}

struct CryptoHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoHeaderView(coin: MockData.sharedInstance.mockCoin)
    }
}
