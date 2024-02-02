//
//  CoinView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI

struct CoinView: View {
    var body: some View {
        Rectangle()
            .frame(width: 350,height: 70)
            .cornerRadius(10)
            .foregroundColor(.white)
            .shadow(color: .gray.opacity(0.5), radius: 2,x:0,y:1)
            .overlay {
                HStack(spacing: 16){
                    Spacer()
                        .frame(width: 0)
                    Image("bitcoin")
                        .resizable()
                        .frame(width: 40,height: 40)
                    VStack(alignment: .leading){
                        HStack{
                            Text("Bitcoin")
                                .font(.getFont(font: .interMedium, size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            Text("$20177")
                                .font(.getFont(font: .interMedium, size: 14))
                                .foregroundColor(.red)
                        }
                        HStack{
                            Text("BTC")
                                .font(.getFont(font: .interMedium, size: 14))
                                .foregroundColor(.gray)
                            Spacer()
                            Text("-12.00%")
                                .font(.getFont(font: .interMedium, size: 14))
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
        CoinView()
    }
}
