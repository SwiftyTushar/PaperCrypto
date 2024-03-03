//
//  CurrentPositionView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 03/02/24.
//

import SwiftUI

struct CurrentPositionView: View {
    @ObservedObject var viewModel:TradesViewModel
    
    init(viewModel:TradesViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        List(0..<2){ index in
            if index == 0{
                HStack{
                    Spacer()
                    VStack{
                        Text(
                            "\(viewModel.totalPNL > 0 ? "+" : "-")\(viewModel.totalPNL.amountWithCurrency(currency: "₹"))")
                        .foregroundColor(viewModel.totalPNL > 0 ? .green : .red)
                            .font(.getFont(font: .interBold, size: 20))
                        Text("Total P&L")
                            .font(.getFont(font: .interMedium, size: 16))
                            .foregroundColor(.gray)
                        
                    }
                    Spacer()
                }
            } else {
                ForEach(viewModel.realtimeUpdates) { order in
                    OrdersView(order: order)
                        .frame(height: 130)
                        .listRowSeparator(.hidden)
                }
            }
        }
        .onChange(of: viewModel.realtimeUpdates) { newValue in
            print("CurrentPositionView.onChange----- \(viewModel.realtimeUpdates.first?.currentPrice ?? 0.0)")
        }
        .listStyle(.plain)
        .listRowSpacing(-10)
        .scrollIndicators(.hidden)
    }
    
}

struct CurrentPositionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentPositionView(viewModel: .init())
    }
}
