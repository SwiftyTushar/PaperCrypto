//
//  SignupViewModel.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 08/02/24.
//

import Foundation
import SwiftUI

class SignupViewModel: BaseViewModel{
    
    var request = SignupRequest()
    
    
    func signup(){
        guard validateFields() else {return}
        startLoadingWithAnimation()
        APICaller.sharedInstance.makeRequest(endpoint: .signup, method: .post, body: request, response: AuthenticationResponse.self) {[weak self] res, error in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.stopLoading()
                if error != nil{
                    self.showError = true
                    self.errorMessage = error ?? ""
                } else {
                    if let response = res{
                        if response.success == false{
                            self.showError = true
                            self.errorMessage = response.message ?? ""
                        } else {
                            AuthManager.shared.saveToken(accessToken: res?.token ?? "")
                            AuthManager.shared.saveUserID(id: res?.userID ?? "")
                            self.success = true
                        }
                    }
                }
            }
        }
    }
    private func validateFields() -> Bool{
        if request.email.isEmpty{
            loading = false
            showError = true
            errorMessage = "Email cannot be empty"
            return false
        }
        
        if request.name.isEmpty{
            loading = false
            showError = true
            errorMessage = "Name cannot be empty"
            return false
        }
        
        if request.username.isEmpty{
            loading = false
            showError = true
            errorMessage = "Username cannot be empty"
            return false
        }
        
        if request.password.isEmpty{
            loading = false
            showError = true
            errorMessage = "Password cannot be empty"
            return false
        }
        return true
        
    }
    
}
