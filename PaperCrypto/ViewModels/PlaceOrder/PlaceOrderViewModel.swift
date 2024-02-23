//
//  PlaceOrderViewModel.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 18/02/24.
//

import Foundation

class PlaceOrderViewModel: BaseViewModel{
    @Published var coin:Coin = MockData.sharedInstance.mockCoin
    var request = PlaceOrderRequest()
    
    func placeOrder(){
        APICaller.sharedInstance.makeRequest(endpoint: .placeOrder, method: .post, body: request, response: PlaceOrderResponse.self) { response, error in
            DispatchQueue.main.async {
                self.stopLoading()
                if error != nil{
                    self.errorMessage = error ?? ""
                    self.showError = true
                } else {
                    self.success = true
                }
            }
        }
    }
    func convertRupeesToAsset(inr:String) -> String{
        guard let convertedINR = Float(inr) else {return "0.0"}
        guard let convertedCryptoPrice = Float(coin.last) else {return "0.0"}
        print("convertRupeesToAsset----- \(convertedINR) crypto \(convertedCryptoPrice) total \(convertedINR/convertedCryptoPrice)")
        let result = String(format: "%.9f", convertedINR/convertedCryptoPrice)
        return result
    }
    
}
