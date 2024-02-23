//
//  OrderModels.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 17/02/24.
//

import Foundation

enum OrderType: String{
    case buy = "buy"
    case sell = "sell"
}

//MARK: PlaceOrderRequest
struct PlaceOrderRequest:Encodable{
    var placedBy, symbol, orderType, buysell: String?
    var assetPrice, assetInr, assetInSymbol: Double?
}
//MARK: PlaceOrderResponse
struct PlaceOrderResponse: Decodable{
    let success:Bool
    let message,orderID:String?
}
