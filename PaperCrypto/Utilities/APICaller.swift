//
//  APICaller.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 07/02/24.
//

import Foundation



class APICaller{
    private init(){}
    static let sharedInstance = APICaller()
    
    let baseURL = "http://localhost:3000/"
    
    enum HTTPMethod:String{
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    
    enum APIEndpoint:String{
        case login = "auth/login"
        case signup = "auth/signup"
        case trendingCoins = "exchange/trending_coins"
        case allCoins = "exchange/cryptos/all"
        case kLines = "exchange/cryptos/klines"
        case placeOrder = "exchange/cryptos/placeorder"
        case getOrders = "exchange/cryptos/orders"
        case getAccountBalance = "exchange/user/balance"
    }
    func makeRequest<T:Encodable,U:Decodable>(endpoint:APIEndpoint,auth:Bool = true,method:HTTPMethod,body:T,response:U.Type,queryItems:[String:String] = [:],completion:@escaping((U?,String?) -> Void)){
        var urlComponent = URLComponents(string: baseURL + endpoint.rawValue)
        
        guard let url = urlComponent?.url else {completion(nil,"URL not found!");return}
        
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if method != .get{
            print("====BODY====")
            print(body)
            print("====BODY====")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            if let encodedData = try? JSONEncoder().encode(body){
                request.httpBody = encodedData
            }
        }
        if auth{
            let accessToken = AuthManager.shared.getToken()
            request.setValue(accessToken, forHTTPHeaderField: "Authorization")
            print("======Headers=======")
            for (key,header) in request.allHTTPHeaderFields ?? [:]{
                print("\(key) : \(header)")
            }
            print("======Headers=======")
        }
        
        if !queryItems.isEmpty{
            urlComponent?.queryItems = []
            for (key,value) in queryItems{
                urlComponent?.queryItems?.append(.init(name: key, value: value))
            }
            request.url = urlComponent?.url
        }
        print("======URL=======")
        print("METHOD:\(method.rawValue) URL: \(request.url?.absoluteString ?? "nil")")
        print("======URL=======")
        URLSession.shared.dataTask(with: request) { data, mRequest, error in
            if error != nil{
                completion(nil,error?.localizedDescription)
            } else {
                if let fetchedData = data{
                    if let decoded = try? JSONDecoder().decode(U.self, from: fetchedData){
                        completion(decoded,nil)
                    } else {
                        completion(nil, "Unable to parse the data")
                    }
                }
            }
        }
        .resume()
        
    }
}
