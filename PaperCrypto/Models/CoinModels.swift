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
struct Coin: Decodable,Identifiable{
    var id: String {symbol}
    let name,symbol, baseAsset: String
    let quoteAsset: String
    let openPrice, lowPrice, highPrice, lastPrice: String
    let volume, bidPrice, askPrice: String
    let at: Int
    let percentageChange:Float
}
//MARK: EmptyRequestBody
struct EmptyRequestBody: Encodable{}
