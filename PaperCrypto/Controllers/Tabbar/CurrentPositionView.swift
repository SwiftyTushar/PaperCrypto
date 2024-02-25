//
//  CurrentPositionView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 03/02/24.
//

import SwiftUI

struct CurrentPositionView: View {
    var orders:[Order]
    var body: some View {
        List(0..<2){ index in
            if index == 0{
                HStack{
                    Spacer()
                    VStack{
                        Text("+₹ 2000.23")
                            .foregroundColor(.green)
                            .font(.getFont(font: .interBold, size: 20))
                        Text("Total P&L")
                            .font(.getFont(font: .interMedium, size: 16))
                            .foregroundColor(.gray)
                        
                    }
                    Spacer()
                }
            } else {
                ForEach(orders) { order in
                    OrdersView(order: order)
                        .frame(height: 130)
                        .listRowSeparator(.hidden)
                }
            }
        }
        .listStyle(.plain)
        .listRowSpacing(-10)
        .scrollIndicators(.hidden)
    }
}

struct CurrentPositionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentPositionView(orders: [MockData.sharedInstance.mockOrder])
    }
}
