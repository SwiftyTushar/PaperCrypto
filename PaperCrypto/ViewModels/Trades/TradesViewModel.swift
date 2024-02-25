//
//  TradesViewModel.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 24/02/24.
//

import Foundation

class TradesViewModel: BaseViewModel{
    @Published var orders:[Order] = []
    
    func getTrades(){
        APICaller.sharedInstance.makeRequest(endpoint: .getOrders, method: .get, body: EmptyRequestBody.init(), response: GetOrdersResponse.self,queryItems: ["userID":AuthManager.shared.getUserID()]) { response, error in
            DispatchQueue.main.async {
                if error != nil{
                    self.showError = true
                    self.errorMessage = error ?? ""
                } else {
                    if let response = response{
                        self.success = true
                        self.orders.removeAll()
                        for order in response.data {
                            if let mOrder = order{
                                self.orders.append(mOrder)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func fetchRealtimeUpdates(){
        
    }
    
}
