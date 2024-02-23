//
//  MarketViewModel.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 15/02/24.
//

import Foundation

class MarketViewModel: BaseViewModel{
    @Published var selectedSegmentIndex = 0
    @Published var coins:[Coin] = []
    
    private var allCoins:[Coin] = []
    func fetchAllCoins(){
        APICaller.sharedInstance.makeRequest(endpoint: .allCoins, method: .get, body: EmptyRequestBody(), response: TrendingCoinsResponse.self) { response, error in
            DispatchQueue.main.async {
                if error != nil{
                    self.showError = true
                    self.errorMessage = error ?? ""
                } else {
                    if let fetchedCoins = response?.data{
                        self.allCoins = fetchedCoins
                        self.filterCoins()
                    }
                }
            }
        }
    }
    func filterCoins(){
        if selectedSegmentIndex != 3{
            if selectedSegmentIndex == 0{
                coins = allCoins
            } else {
                if selectedSegmentIndex == 1{
                    coins = allCoins.filter({ coin in
                        return coin.percentageChange > 0.00
                    })
                } else {
                    coins = allCoins.filter({ coin in
                        return coin.percentageChange < 0.00
                    })
                }
            }
        }
    }
}
