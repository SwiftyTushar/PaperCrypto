//
//  SocketManager.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 08/02/24.
//
import Foundation
import SocketIO
import JavaScriptCore

class PCSocketManager{
    static let sharedInstance = PCSocketManager()
    
    private let manager = SocketManager(socketURL: URL(string: "http://localhost:3000/")!, config: [.log(true), .compress])
    private var socket:SocketIOClient?
    
    private init(){
        socket = manager.defaultSocket
        socket?.on("connect") { _, _ in
            print("Socket Connected")
        }
    }
    func establishSocketConnection(){
        socket?.connect()
    }
    private func fetchRealtimeUpdate(event:PCSocketEvents,completion:@escaping([Any])->Void){
        print("fetchRealtimeUpdate---- connnected \(socket?.status == .connected)")
        socket?.on("tickerUpdate", callback: { data, ack in
            print("PCSOCKETMANAGER.fetchRealtimeUpdate------ data \(data)")
            completion(data)
        })
    }
    
    func getRealtimeUpdates(orders:[Order],completion:@escaping(([Order]) -> Void)){
        fetchRealtimeUpdate(event: .tickerUpdate) { response in
            if let dict = response.first as? [String:Any]{
                let symbol = dict["symbol"] as? String ?? ""
                print("getRealtimeUpdates------ \(dict)")
                let firstIndexForSymbol = orders.firstIndex{$0.symbol == symbol} ?? -1
                if firstIndexForSymbol != -1{
                    var modifiedOrder = orders[firstIndexForSymbol]
                    modifiedOrder.currentPrice = dict["last"] as? Double
                    print("getRealtimeUpdates----- socket.io bro--- \(modifiedOrder)")
                    var modifiedOrdersArray = orders
                    modifiedOrdersArray[firstIndexForSymbol] = modifiedOrder
                    completion(modifiedOrdersArray)
                }
            }
        }
    }
}

