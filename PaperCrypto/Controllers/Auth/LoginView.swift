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
            
//            Button(action: handleSignInAction) {
//                Text("LOGIN")
//                    .font(.getFont(font: .interBold, size: 18))
//                    .frame(height: 50)
//                    .frame(maxWidth: .infinity)
//                    .foregroundColor(.white)
//            }
//            .background(Color.appColorBlue)
//            .cornerRadius(10)
//            HStack(spacing: -10){
//                Spacer()
//
//                Spacer()
//            }
            AnimatedLoadingButton(title: "LOGIN") {
                print("Show Data")
            }
            Spacer()
        }
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
