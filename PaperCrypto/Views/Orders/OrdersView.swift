//
//  OrdersView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 24/02/24.
//

import SwiftUI

struct OrdersView: View {
    var order:Order
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(.white)
            .shadow(radius: 1)
            .overlay {
                VStack{
                    HStack{
                        Image(order.symbol)
                            .resizable()
                            .frame(width: 40,height: 40)
                        Text(order.name)
                            .font(.getFont(font: .nunitoBold, size: 18))
                        Spacer()
                        Text("\(order.quantity) \(order.symbol.uppercased())")
                            .font(.getFont(font: .nunitoSemibold, size: 16))
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                    Rectangle()
                        .foregroundStyle(.gray.opacity(0.2))
                        .frame(height: 1)
                    HStack{
                        VStack{
                            Text("ENTRY")
                                .font(.getFont(font: .interRegular, size: 10))
                                .foregroundStyle(.gray)
                            Text(order.entryPrice.getConvertedDecimal(points: 2))
                                .font(.getFont(font: .interMedium, size: 14))
                        }
                        Spacer()
                        VStack{
                            Text("CURRENT")
                                .font(.getFont(font: .interRegular, size: 10))
                                .foregroundStyle(.gray)
                            Text("-23412")
                                .font(.getFont(font: .interMedium, size: 14))
                        }
                        Spacer()
                        VStack{
                            Text("TARGET")
                                .font(.getFont(font: .interRegular, size: 10))
                                .foregroundStyle(.gray)
                            Text("\(order.getFormattedTarget())")
                                .font(.getFont(font: .interMedium, size: 14))
                        }
                        Spacer()
                        VStack{
                            Text("STOP LOSS")
                                .font(.getFont(font: .interRegular, size: 10))
                                .foregroundStyle(.gray)
                            Text("\(order.getFormattedSL())")
                                .font(.getFont(font: .interMedium, size: 14))
                        }
                    }
                    .padding([.horizontal,.top],12)
                    
                    Spacer()
                }
                .padding(.vertical)
            }
    }
}

#Preview {
    OrdersView(order: MockData.sharedInstance.mockOrder)
        .frame(height: 150)
        .padding()
}
