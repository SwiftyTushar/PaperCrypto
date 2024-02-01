//
//  Font+getFont.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI

enum AppFonts:String{
    case interMedium = "Inter-Medium"
    case interBold = "Inter-Bold"
    case interRegular = "Inter-Regular"
}

extension Font{
    static func getFont(font:AppFonts,size:CGFloat,relativeTo:TextStyle = .body) -> Font{
        return Font.custom(font.rawValue, size: size,relativeTo: relativeTo)
    }
}
