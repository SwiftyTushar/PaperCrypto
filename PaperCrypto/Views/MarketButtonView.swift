//
//  MarketButtonView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 11/02/24.
//

import SwiftUI

struct MarketButtonView: View {
    var title:String
    var selected:Bool = false
   // @ViewBuilder var content:ContentView
    var body: some View {
        VStack(spacing:0){
            Text(title)
                .font(.getFont(font: .interMedium, size: 17))
            .foregroundStyle(selected ? Color.appColorBlue : .gray)
            .background {
                if selected{
                    Rectangle()
                        .foregroundStyle(Color.appColorBlue)
                        .frame(height: 3)
                        .padding(.top,20)
                }
            }
        }
    }
}

#Preview {
    MarketButtonView(title: "Hello")
        .frame(height: 50)
}
