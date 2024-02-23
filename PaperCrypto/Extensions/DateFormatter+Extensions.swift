//
//  DateFormatter+Extensions.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 16/02/24.
//

import Foundation

enum DateFormatterType: String{
    case hourMinute = "hh:mm"
}


extension Date{
    func getFormattedDate(format:DateFormatterType) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}
