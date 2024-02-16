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
    let mockCoin = Coin(name: "Bitcoin", symbol: "btc", open: "4303530", last: "4484646.0", sell: "4488230.0", buy: "4487646.0", percentageChange: 4.208545078)
}
