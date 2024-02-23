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
    let name, symbol, open: String
    var last:String
    let sell, buy: String
    let percentageChange: Double

    enum CodingKeys: String, CodingKey {
        case name, symbol
        case open
        case last, sell, buy, percentageChange
    }
}
//MARK: EmptyRequestBody
struct EmptyRequestBody: Encodable{}
