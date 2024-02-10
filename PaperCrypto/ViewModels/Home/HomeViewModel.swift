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
        
    }
}
