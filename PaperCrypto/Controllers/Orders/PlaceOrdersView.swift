//
//  PlaceOrdersView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 17/02/24.
//

import SwiftUI
import SlideButton


struct PlaceOrdersView: View {
    @State private var selectedOrderType:OrderType = .buy
    @State private var triggerOrder = false
    @State var inRupees = ""
    @State var inCrypto = ""
    @State var target = ""
    @State var stopLoss = ""
    @State var orderType = 0
    @State var entryPrice = ""
    
    var disableSlider: Bool {
        if orderType == 0 {
            if inRupees.isEmpty || inCrypto.isEmpty{
                return true
            }
            return false
        }
        if inRupees.isEmpty || inCrypto.isEmpty || entryPrice.isEmpty{
            return true
        }
        return false
    }
    
    let coin:Coin
    
    @StateObject var viewModel = PlaceOrderViewModel()
    
    var body: some View {
        VStack{
            CryptoHeaderView(coin: coin)
            OrderTypeButtonStack(selectedOrderType: $selectedOrderType)
            .padding()
            
            Picker("", selection: $orderType) {
                Text("Instant").tag(0)
                Text("Limit").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            Spacer()
                .frame(height: 50)
            VStack(spacing:5){
                Text("ESTIMATED \(selectedOrderType == .buy ? "BUYING" : "SELLING") PRICE")
                    .font(.getFont(font: .nunitoBold, size: 12))
                    .foregroundStyle(.gray)
                Text(MockData.sharedInstance.mockCoin.last)
                    .font(.getFont(font: .nunitoMedium, size: 18))
                HStack(spacing:5){
                    Rectangle()
                        .foregroundStyle(.gray.opacity(0.4))
                        .frame(height: 1)
                    Text("How much do you want to \(selectedOrderType.rawValue)?")
                        .lineLimit(1)
                        .font(.getFont(font: .nunitoSemibold, size: 15))
                        .foregroundStyle(.black.opacity(0.8))
                        .fixedSize(horizontal: true, vertical: false)
                    Rectangle()
                        .foregroundStyle(.gray.opacity(0.4))
                        .frame(height: 1)
                }
                
                HStack{
                    PCTextField(placeHolder: "In Rupees", text: $inRupees, keyboardType: .decimalPad,shouldHideLeadingImage: true)
                        .onSubmit {
                            print("In rupees")
                        }
                    Text("=")
                        .fontWeight(.bold)
                    PCTextField(placeHolder: "In \(coin.symbol.uppercased())", text: $inCrypto, keyboardType: .decimalPad,shouldHideLeadingImage: true)
                }
                .padding()
                if orderType == 1 {
                    PCTextField(placeHolder: "Entry price", text: $entryPrice, keyboardType: .decimalPad,shouldHideLeadingImage: true)
                        .padding()
                }
                HStack{
                    PCTextField(placeHolder: "Stoploss", text: $stopLoss, keyboardType: .decimalPad,shouldHideLeadingImage: true)
                    Text(" ")
                        .fontWeight(.bold)
                    PCTextField(placeHolder: "Target", text: $target, keyboardType: .decimalPad,shouldHideLeadingImage: true)
                }
                .padding()
                HStack(spacing:5){
                    Text("Balance:")
                        .font(.getFont(font: .nunitoRegular, size: 14))
                        .foregroundStyle(.gray)
                    Text("$100")
                        .font(.getFont(font: .nunitoSemibold, size: 14))
                    Spacer()
                }
                .padding(.horizontal)
                
            }
            
            Spacer()
            SlideButton("Slide to \(selectedOrderType == .buy ? "Buy" : "Sell")",styling: .init(
                indicatorSize: 60,
                indicatorColor: selectedOrderType == .buy ? .green : .red,
                textColor: disableSlider ? .gray : selectedOrderType == .buy ? .green : .red), action: {
                    viewModel.request.buysell = selectedOrderType.rawValue
                    viewModel.request.symbol = coin.symbol
                    viewModel.request.assetInSymbol = Double(inCrypto)
                    viewModel.request.assetInr = Double(inRupees)
                    viewModel.request.orderType = orderType == 0 ? "instant" : "limit"
                    viewModel.request.placedBy = AuthManager.shared.getUserID()
                    viewModel.request.assetPrice = Double(coin.last)
                    viewModel.placeOrder()
            })
            .disabled(disableSlider)
            .padding()
        }
        .onChange(of: inRupees, perform: { value in
            print("onChangeOfValue---")
            inCrypto = viewModel.convertRupeesToAsset(inr: inRupees)
        })
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    PlaceOrdersView(coin: MockData.sharedInstance.mockCoin)
}
