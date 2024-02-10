//
//  Float+Extensions.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 10/02/24.
//

import Foundation

extension Float{
    func amountWithCurrency(currency:String) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        return "\(formatter.string(from: NSNumber(value: self)) ?? "")"
    }
}
