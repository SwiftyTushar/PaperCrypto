//
//  RoundedOutlineButton.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 17/02/24.
//

import SwiftUI



struct OrderTypeButton: View {
    @Binding var selected:Bool
    var orderType:OrderType
    var onTap:(() -> Void)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(orderType == .buy ? selected ? Color.green.opacity(0.8) : Color.green.opacity(0.2) : selected ? Color.red.opacity(0.8) : Color.red.opacity(0.2))
        
            .overlay(content: {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: selected ? 1.0 : 0.0)
                    .foregroundStyle(orderType == .buy ? Color.green : Color.red)
                    .overlay {
                        HStack{
                            Text(orderType == .buy ? "Buy" : "Sell")
                                .font(.getFont(font: .interMedium, size: 16))
                                .padding(.horizontal)
                                .foregroundStyle(selected ? .white : orderType == .buy ? Color.green : Color.red)
                            Spacer()
                            if selected{
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 22,height: 22)
                                    .foregroundStyle(.white)
                                    .padding(.trailing)
                            }
                        }
                    }
            })
            .onTapGesture {
                onTap()
            }
    }
}

#Preview {
    OrderTypeButton(selected: .constant(false), orderType: .buy, onTap: {
        
    })
        .frame(height: 50)
        .padding(.horizontal)
}
