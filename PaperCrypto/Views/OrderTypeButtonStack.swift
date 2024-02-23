//
//  OrderTypeButtonStack.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 17/02/24.
//

import SwiftUI

struct OrderTypeButtonStack: View {
    @Binding var selectedOrderType:OrderType
    @State private var buySelected = false
    var body: some View {
        HStack{
            OrderTypeButton(selected: .constant(selectedOrderType == .buy), orderType: .buy) {
                withAnimation {
                    selectedOrderType = .buy
                }
            }
            
            OrderTypeButton(selected: .constant(selectedOrderType == .sell), orderType: .sell) {
                withAnimation {
                    selectedOrderType = .sell
                }
            }
            
//            OrderTypeButton(selected: $buySelected, orderType: .buy)
//            OrderTypeButton(selected: $sellSelected, orderType: .sell)
        }
        .frame(height: 50)
    }
}

#Preview {
    OrderTypeButtonStack(selectedOrderType: .constant(.buy))
        .padding(.horizontal)
}
