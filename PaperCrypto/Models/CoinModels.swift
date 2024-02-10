//
//  CoinModels.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 10/02/24.
//

import Foundation

//MARK: TrendingCoinsResponse
struct TrendingCoinsResponse: Decodable{
    var success:Bool
    var message:String
    var data:[Coin]
}

//MARK: Coin
struct Coin: Decodable{
    let symbol, baseAsset: String
    let quoteAsset: String
    let openPrice, lowPrice, highPrice, lastPrice: String
    let volume, bidPrice, askPrice: String
    let at: Int
}
