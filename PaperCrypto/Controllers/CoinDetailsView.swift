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
    private var chartTimeStamps:[String] = ["1 H","24 H","1 W","1 M","6 M","1 Y","All"]
    @State var selectedTimeStamp = "1 H"
    
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
            VStack{
                
            }
            ScrollView(.horizontal) {
                LazyHStack(spacing:8){
                    ForEach(chartTimeStamps,id: \.self) { timeStamp in
                        Capsule()
                            .stroke(Color.blue,lineWidth:selectedTimeStamp == timeStamp ? 2 : 0)
                            .frame(width: 50,height: 27)
                            .background(.gray.opacity(0.09))
                            .cornerRadius(20)
                            .overlay {
                                Text(timeStamp)
                                    .foregroundColor(selectedTimeStamp == timeStamp ? .blue : .gray)
                                    .font(.getFont(font: .interRegular, size: 12))
                            }
                            .onTapGesture {
                                selectedTimeStamp = timeStamp
                            }
//                        Button(timeStamp) {
//
//                        }
//                        .font(.getFont(font: .interMedium, size: 14))
//                        .foregroundColor(.black.opacity(0.6))
//                        .frame(width: 48,height: 30)
//                        .background(.gray.opacity(0.09))
//                        .cornerRadius(20)
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            .frame(height: 50)
            .padding([.leading,.trailing],10)
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
