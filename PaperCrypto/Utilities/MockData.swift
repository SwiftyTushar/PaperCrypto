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
    let mockOrder = Order.init(orderID: "qwerqwrq", entryPrice: 1234124.634, symbol: "btc", orderBy: "qwejroiqw", buySell: "buy", target: 312412.0, stopLoss: 234816.0, tradeExit: false, quantity: 0.9241234, name: "Bitcoin", currentPrice: 471234.5, exitTime: nil)
}
