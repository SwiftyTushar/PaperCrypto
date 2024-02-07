//
//  SignupView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 05/02/24.
//

import SwiftUI

struct SignupView: View {
    @State var emailText:String = ""
    @State var passwordText:String = ""
    @State var usernameText:String = ""
    @State var nameText:String = ""
    @State var emailIsWrong = false
    @Environment(\.dismiss) private var dismiss
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
            Text("Signup")
                .foregroundColor(.black)
                .font(.getFont(font: .interMedium, size: 30))
            
            PCTextField(placeHolder: "Email", text: $emailText, keyboardType: .emailAddress,leadingImage: Image(systemName: "envelope"))
            PCTextField(placeHolder: "Name", text: $nameText, keyboardType: .emailAddress,leadingImage: Image(systemName: "person"))
            PCTextField(placeHolder: "Username", text: $usernameText, keyboardType: .emailAddress,leadingImage: Image(systemName: "person"))
            PCTextField(placeHolder: "Password", text: $passwordText, keyboardType: .emailAddress,leadingImage: Image(systemName: "lock"),isPasswordField: true)
            
            Button(action: handleSignInAction) {
                Text("Signup")
                    .font(.getFont(font: .interBold, size: 18))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
            }
            .background(Color.appColorBlue)
            .cornerRadius(10)
            
            
            
            Spacer()
        }
        .toolbar(.hidden, for: .navigationBar)
        .padding(.all,20)
    }
    func handleSignInAction(){
        withAnimation(.default.repeatCount(2)) {
            emailIsWrong.toggle()
        }
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
