//
//  AuthModels.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 07/02/24.
//

import Foundation

// MARK: Login
struct LoginRequest: Encodable{
    var email = ""
    var password = ""
    init(){}
}

struct AuthenticationResponse: Decodable{
    var success:Bool?
    var message,token,userID:String?
}
//MARK: Signup
struct SignupRequest: Encodable{
    //email, name, username, password
    var email = String()
    var name = String()
    var username = String()
    var password = String()
    init(){}
}
