//
//  HomeViewModel.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 10/02/24.
//

import Foundation

class HomeViewModel: BaseViewModel{
    @Published var trendingCoins:[Coin] = []
    
    func fetchTrendingCoins(){
        APICaller.sharedInstance.makeRequest(endpoint: .trendingCoins, method: .get, body: EmptyRequestBody(), response: TrendingCoinsResponse.self) { response, error in
            DispatchQueue.main.async {
                if let error = error{
                    self.showError = true
                    self.errorMessage = error
                } else {
                    if let response = response{
                        self.trendingCoins = response.data
                    }
                }
            }
        }
    }
}
