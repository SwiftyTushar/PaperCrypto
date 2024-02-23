//
//  CoindDetailsResponse.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 16/02/24.
//

import Foundation

//MARK: CoinDetailsResponse
struct CoinDetailsResponse: Decodable{
    let success: Bool
    let message: String
    let data: [[Double]]
}
//MARK: CoinChartData
struct CoinChartData{
    var timeStamp:String
    //var chartData:[Double] = []
    var value:Double
    
    init(data:[Double]){
        let date = Date(timeIntervalSince1970: data[0])
        self.timeStamp = date.getFormattedDate(format: .hourMinute)
        self.value = data[1] + data[3]
    }
}


