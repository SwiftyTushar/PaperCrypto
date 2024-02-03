//
//  BuySellCoinView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 02/02/24.
//

import SwiftUI
import Charts

struct ValuePerCategory {
    var category: String
    var value: Double
}


let data: [ValuePerCategory] = [
    .init(category: "A", value: 300),
    .init(category: "B", value: 200),
    .init(category: "C", value: 400),
    .init(category: "D", value: 560),
    .init(category: "E", value: 1000),
    .init(category: "F", value: 950),
    .init(category: "G", value: 300),
    .init(category: "H", value: 200),
    .init(category: "I", value: 400),
    .init(category: "J", value: 560),
    .init(category: "K", value: 1000),
    .init(category: "L", value: 950)
]

struct CoinDetailsView: View {
  
    var body: some View {
        VStack(alignment:.leading,spacing: 8){
            CryptoHeaderView()
            HStack{
                Spacer()
                    .frame(width: 20)
                Text("$20502")
                    .font(.getFont(font: .interMedium, size: 16))
                Text("-2.1%")
                    .font(.getFont(font: .interMedium, size: 12))
                    .foregroundColor(.red)
            }
            Spacer()
                .frame(height: 20)
            Chart(data, id: \.category) { item in
                LineMark(
                    x: .value("Category", item.category),
                    y: .value("Value", item.value)
                )
            }
            .chartXAxis(content: {
                AxisMarks(stroke: StrokeStyle(lineWidth: 0))
            })
            .chartYAxis(.hidden)
            .frame(height: 350)
            ScrollView(.horizontal) {
                LazyHStack{
                    ForEach(0..<1000) { datum in
                        Text(datum < 30 ? "\(datum) Day" : "\(datum) Month")
                            .padding(.all,10)
                            .background(.gray.opacity(0.1))
                            .cornerRadius(8)
                            .font(.getFont(font: .interRegular, size: 12))
                    }
                }
            }
            .scrollIndicators(.hidden)
            .frame(height: 50)
            .padding()
            Spacer()
            BuySellView()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView()
    }
}
