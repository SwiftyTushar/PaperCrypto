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
    let mockOrder = Order(orderID: "ewr", entryPrice: 444000, symbol: "btc", orderBy: "qwerq", buySell: "buy", target: 55000, stopLoss: 512313, exitTime: 12341234, tradeExit: false, quantity: 0.2341, v: 1, name: "Bitcoin")
}
