//
//  PortfolioHeader.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 03/02/24.
//

import SwiftUI
// ⟨₹
struct TradesHeaderView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.appColorBlue)
            .frame(height: 180)
            .overlay {
                HStack{
                    VStack(alignment: .leading,spacing: 20){
                        Text("Paper Trading")
                            .font(.getFont(font: .interBold, size: 22))
                            .foregroundColor(.white)
                        VStack(alignment: .leading, spacing:8){
                            Text("Available Margin")
                                .font(.getFont(font: .interMedium, size: 12))
                                .foregroundColor(.white)
                            Text("₹ 2,800.75")
                                .font(.getFont(font: .interBold, size: 18))
                                .foregroundColor(.white)
                            Text("Total P&L")
                                .font(.getFont(font: .interMedium, size: 12))
                                .foregroundColor(.white)
                            HStack{
                                Text("+10,0000")
                                    .font(.getFont(font: .interBold, size: 18))
                                    .foregroundColor(.white)
                                Text("+10.1 %")
                                    .font(.getFont(font: .interMedium, size: 14))
                                    .foregroundColor(.white.opacity(0.7))
                            }
                        }
                        .padding(.top,-5)
                        
                        
                    }
                    .padding(.leading,20)
                    Spacer()
                }
                
            }
            .padding()
    }
}

struct TradesHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TradesHeaderView()
    }
}
