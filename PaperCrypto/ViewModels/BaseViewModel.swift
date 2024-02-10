//
//  BaseViewModel.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 09/02/24.
//

import Foundation
import SwiftUI

class BaseViewModel: ObservableObject{
    @Published var loading = false
    @Published var showError = false
    @Published var errorMessage = String()
    @Published var success = false
    
    func startLoadingWithAnimation(){
        withAnimation {
            self.loading = true
        }
    }
    func stopLoading(){
        withAnimation {
            self.loading = false
        }
    }
    
}
