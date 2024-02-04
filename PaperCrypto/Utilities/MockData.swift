//
//  MockData.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 04/02/24.
//

import Foundation
//  ₹
class MockData{
    static let sharedInstance = MockData()
    private init(){}
    var coinData:[CoinViewData] = [
        CoinViewData(title: "Bitcoin", subTitle: "BTC", price: "+₹1234.0", pNLPercentage: "-12.9%"),
        CoinViewData(title: "Shiba-Inu", subTitle: "SHIB", price: "+₹0.00009", pNLPercentage: "+12.9%"),
        CoinViewData(title: "Cardano", subTitle: "ADA", price: "+₹0.90", pNLPercentage: "+1.0%"),
        CoinViewData(title: "Doge Coin", subTitle: "DOG", price: "+₹21.0", pNLPercentage: "1.0%")
    ]
}
