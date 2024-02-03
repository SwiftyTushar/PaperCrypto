//
//  BuySellView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 03/02/24.
//

import SwiftUI

struct BuySellView: View {
    var body: some View {
        Rectangle()
            .frame(height: 80)
            .foregroundColor(.white)
            .shadow(color: .gray.opacity(0.1),radius: 0.5,y: -3)
            .overlay {
                HStack(spacing: 20){
                    Button(action:{}) {
                      HStack {
                          Spacer()
                        Text("Buy")
                              .foregroundColor(.white)
                        Spacer()
                      }
                      .contentShape(Rectangle())
                    }
                    .frame(minHeight: 50)
                    .background(.blue)
                    .cornerRadius(8)
                    
                    Button(action:{}) {
                      HStack {
                          Spacer()
                        Text("Sell")
                              .foregroundColor(.white)
                        Spacer()
                      }
                      .contentShape(Rectangle())
                    }
                    .frame(minHeight: 50)
                    .background(.blue)
                    .cornerRadius(8)
                }
                .padding([.leading,.trailing],20)
            }
    }
}

struct BuySellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Spacer()
            BuySellView()
        }
        
    }
}
