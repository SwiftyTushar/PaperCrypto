//
//  AuthModels.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 07/02/24.
//

import Foundation

struct LoginRequest: Encodable{
    var email = ""
    var password = ""
    init(){}
}

struct AuthenticationResponse: Decodable{
    var success:Bool?
    var message,token:String?
}
