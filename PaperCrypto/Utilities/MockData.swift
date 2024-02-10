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
    let mockCoin = Coin(name: "Bitcoin", symbol: "btcinr",baseAsset: "btc",quoteAsset: "inr",openPrice: "3985665",lowPrice: "3978985.0",highPrice: "4200000.0",lastPrice: "4066244.0",volume: "11.24252",bidPrice: "4039202.0",askPrice: "4040396.0",at: 1707538016000, percentageChange: 1.5)
}
