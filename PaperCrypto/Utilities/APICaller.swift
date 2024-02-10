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
    }
    func makeRequest<T:Encodable,U:Decodable>(endpoint:APIEndpoint,auth:Bool = true,method:HTTPMethod,body:T,response:U.Type,completion:@escaping((U?,String?) -> Void)){
        guard let url = URL(string: baseURL + endpoint.rawValue) else {completion(nil,"URL not found!");return}
        print("======URL=======")
        print("METHOD:\(method.rawValue) URL: \(url.absoluteString)")
        print("======URL=======")
        
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
