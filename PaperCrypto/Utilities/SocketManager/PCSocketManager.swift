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
           // self.getRealtimeUpdates(for: ["btc@inr"])
        }
    }
    func establishSocketConnection(){
        socket?.connect()
    }
    private func fetchRealtimeUpdate(event:PCSocketEvents,completion:@escaping([Any])->Void){
        socket?.on(event.rawValue, callback: { data, ack in
            completion(data)
        })
    }
    func getRealtimeUpdates(orders:[Order]){
        if !orders.isEmpty{
            let orderTickers = orders.map{$0.symbol}
            
            fetchRealtimeUpdate(event: .tickerUpdate) { response in
               
            }
        }
    }
}

