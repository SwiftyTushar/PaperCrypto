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

//entryPrice:entryPrice,
//      symbol:symbol,
//      orderBy:userID,
//      orderType:orderType,
//      buySell:buySell,
//      target:target,
//      stopLoss:stopLoss

struct PlaceOrderRequest:Encodable{
    var entryPrice,target,stopLoss,quantity:Double?
    var userID,orderType,buySell,symbol:String?
}
//MARK: PlaceOrderResponse
struct PlaceOrderResponse: Decodable{
    let success:Bool
    let message,orderID:String?
}
//MARK: Order
struct GetOrdersResponse: Decodable{
    let success:Bool
    let message:String
    let data:[Order?]
}
//MARK: Order
struct Order: Decodable,Identifiable{
    var id: String {orderID}
    let orderID: String
    let entryPrice: Double
    let symbol, orderBy, buySell: String
    let target, stopLoss: Double?
    let exitTime:Int?
    let tradeExit: Bool
    let quantity: Double
    let v: Int
    let name: String
    var currentPrice:Double?
    
    mutating func currentPrice(_ dict:[String:Any]){
        currentPrice = dict["c"] as? Double
    }
    
    func getFormattedTarget() -> String{
        return target == nil ? "--" : target!.getConvertedDecimal(points: 2)
    }
    func getFormattedSL() -> String{
        return stopLoss == nil ? "--" : target!.getConvertedDecimal(points: 2)
    }
    enum CodingKeys: String, CodingKey {
        case orderID = "_id"
        case entryPrice, symbol, orderBy, buySell, target, stopLoss, exitTime, tradeExit, quantity
        case v = "__v"
        case name
    }
}

