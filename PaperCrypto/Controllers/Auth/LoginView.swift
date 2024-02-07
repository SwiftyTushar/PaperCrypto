//
//  LoginView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 04/02/24.
//

import SwiftUI

struct LoginView: View {
    @State var emailText:String = ""
    @State var passwordText:String = ""
    @State var emailIsWrong = false
    @State var progressValue:Float = 0.5
    @Environment(\.dismiss) private var dismiss
    @State var navigateToHome = false
    @StateObject var viewModel = LoginViewModel()
    @State var loading = false
    
    var body: some View {
        VStack(alignment:.leading,spacing:20){
            HStack{
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 20,height: 15)
                    .onTapGesture {
                        dismiss()
                    }
                Spacer()
                Image("icOrangeCircle")
                    .resizable()
                    .frame(width: 40,height: 40)
            }
            .padding(.top,-10)
            Spacer()
            Text("Login")
                .foregroundColor(.black)
                .font(.getFont(font: .interMedium, size: 30))
            
            PCTextField(placeHolder: "Email", text: $emailText, keyboardType: .emailAddress,leadingImage: Image(systemName: "envelope"))
            PCTextField(placeHolder: "Password", text: $passwordText, keyboardType: .emailAddress,leadingImage: Image(systemName: "lock"),isPasswordField: true)
            
            AnimatedLoadingButton(title: "LOGIN",loading: $viewModel.loading) {
                viewModel.request.email = emailText
                viewModel.request.password = passwordText
                loading = viewModel.loading
                viewModel.login()
            }
            Spacer()
        }
        .alert("Error", isPresented: $viewModel.showError, actions: {
            Button("Ok", role: .cancel) {
                viewModel.stopLoadingWithAnimation()
            }
        }, message: {
            Text(viewModel.errorMessage)
        })
        .toolbar(.hidden, for: .navigationBar)
        .padding(.all,20)
        .navigationDestination(isPresented: $navigateToHome) {
            ContentView()
                .toolbar(.hidden, for: .navigationBar)
        }
    }
    func handleSignInAction(){
        navigateToHome = true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
