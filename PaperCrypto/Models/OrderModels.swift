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
struct Order: Decodable,Identifiable,Equatable{
    var id: String {orderID}
    let orderID: String
    let entryPrice: Double?
    let symbol, orderBy, buySell: String?
    let target, stopLoss: Double?
    let tradeExit: Bool?
    let quantity: Double?
    let name: String
    var currentPrice: Double?
    let exitTime:Int?
    
//    mutating func currentPrice(_ dict:[String:Any]){
//        currentPrice = dict["c"] as? Double
//    }
    
    func getFormattedTarget() -> String{
       // return target == nil ? "--" : target!.getConvertedDecimal(points: 2)
        return "--"
    }
    func getFormattedSL() -> String{
        //return stopLoss == nil ? "--" : target!.getConvertedDecimal(points: 2)
        return "--"
    }
}
//MARK: UserBalanceRequest
struct UserBalanceRequest: Encodable{
    let userID = AuthManager.shared.getUserID()
}
//MARK: UserBalanceResponse
struct UserBalanceResponse: Decodable{
    var success:Bool
    var message:String
    var capital:Double?
}
