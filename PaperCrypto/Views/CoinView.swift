//
//  CoinView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI

struct CoinView: View {
    @State var coinData:CoinViewData
    var body: some View {
        RoundedRectangle(cornerRadius:10)
            .frame(width: .infinity,height: 70)
            .foregroundColor(.white)
            .shadow(color: .gray.opacity(0.5), radius: 1,x:0,y:0)
            .overlay {
                HStack(spacing: 16){
                    Spacer()
                        .frame(width: 0)
                    Image("bitcoin")
                        .resizable()
                        .frame(width: 40,height: 40)
                    VStack(alignment: .leading){
                        HStack{
                            Text(coinData.title)
                                .font(.getFont(font: .interMedium, size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            Text(coinData.price)
                                .font(.getFont(font: .interMedium, size: 15))
                                .foregroundColor(.black)
                        }
                        HStack{
                            Text(coinData.subTitle)
                                .font(.getFont(font: .interMedium, size: 14))
                                .foregroundColor(.gray)
                            Spacer()
                            Text(coinData.pNLPercentage)
                                .font(.getFont(font: .interMedium, size: 10))
                                .foregroundColor(.red)
                        }
                    }
                    Spacer()
                }
            }
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(coinData: MockData.sharedInstance.coinData[0])
            .padding()
    }
}
