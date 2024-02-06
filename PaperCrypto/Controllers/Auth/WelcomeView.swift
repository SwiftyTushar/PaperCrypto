//
//  WelcomView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 06/02/24.
//

import SwiftUI

struct WelcomeView: View {
    @State var navigateToLogin:Bool = false
    @State var navigateToSignup:Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                Spacer()
                HStack{
                    Image(PCImages.icOrangeCircle)
                        .resizable()
                        .frame(width: 80,height: 80)
                    Spacer()
                }
                Text("Welcome to Paper Crypto by Tushar")
                    .font(.getFont(font: .interBold, size: 25))
                    .foregroundColor(.black.opacity(0.6))
                
                VStack(spacing:10){
                    Color.gray
                        .opacity(0.6)
                        .frame(height: 0.3)

                    PCButtonImage(trailingImage: Image(systemName: "person"), title: "Open a new account", action: {
                        navigateToSignup = true
                    })
                    Color.gray
                        .opacity(0.6)
                        .frame(height: 0.3)
                    PCButtonImage(trailingImage: Image(systemName: "rectangle.portrait.and.arrow.right"), title: "Login", action: {
                        navigateToLogin = true
                    })
                    Color.gray
                        .opacity(0.6)
                        .frame(height: 0.3)
                }
                .padding(.top,20)
                
                Spacer()
            }
            .padding()
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
            .navigationDestination(isPresented: $navigateToSignup) {
                SignupView()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
