//
//  LoginViewModel.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 07/02/24.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject{
    var request = LoginRequest()
    @Published var loading:Bool = false
    @Published var showError:Bool = false
    @Published var errorMessage = ""
    
    func stopLoadingWithAnimation(){
        withAnimation {
            self.loading = false
        }
    }
    
    func login(){
        if request.email.isEmpty{
            showError = true
            errorMessage = "Email cannot be empty"
            return
        }
        
        if request.password.isEmpty{
            showError = true
            errorMessage = "Email cannot be empty"
            return
        }
        
        
        withAnimation {
            loading = true
        }
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
            APICaller.sharedInstance.makeRequest(endpoint: .login, method: .post, body: self.request, response: AuthenticationResponse.self) { response, error
                in
                DispatchQueue.main.async {
                    self.stopLoadingWithAnimation()
                    if error != nil{
                        self.showError = true
                        self.errorMessage = error ?? ""
                    } else {
                        if let response = response{
                            if response.success == false{
                                self.showError = true
                                self.errorMessage = response.message ?? ""
                            } else {
                                AuthManager.shared.saveToken(accessToken: response.token ?? "")
                            }
                        }
                    }
                }
            }
            timer.invalidate()
        }
        
    }
}
