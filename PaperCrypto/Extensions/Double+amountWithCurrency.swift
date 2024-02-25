//
//  Double+amountWithCurrency.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 24/02/24.
//

import Foundation

extension Double{
    func amountWithCurrency(currency:String) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        return "\(formatter.string(from: NSNumber(value: self)) ?? "")"
    }
    func getConvertedDecimal(points:Int) -> String{
        String(format: "%.\(points)f", self)
    }
}
