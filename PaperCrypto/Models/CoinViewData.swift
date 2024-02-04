//
//  CoinViewData.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 04/02/24.
//

import Foundation
//  ₹
struct CoinViewData:Hashable{
    var id = UUID()
    
    var title,subTitle,price,pNLPercentage:String
    
    
    static func == (lhs: CoinViewData, rhs: CoinViewData) -> Bool {
        // Compare properties to check for equality
        return lhs.title == rhs.title
    }
}
