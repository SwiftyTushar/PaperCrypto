//
//  HomeScreenCardView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI

struct HomeScreenCardView: View {
    var userName:String
    var body: some View {
        Rectangle()
            .foregroundColor(.blue)
            .frame(width: 350,height: 150)
            .cornerRadius(10)
            .overlay {
                ZStack(alignment: .leading){
                    HStack{
                        Spacer()
                        Image("halfCircle")
                            .resizable()
                            .frame(width: 150,height: 150)
                    }
                    VStack(alignment: .leading,spacing: 0){
                        Spacer()
                            .frame(height: 20)
                        Text("Welcome \(userName),")
                            .font(Font.getFont(font: .interMedium, size: 14))
                            .foregroundColor(.white)
                        Spacer()
                            .frame(height: 10)
                        Text("Make your first investment today")
                            .font(Font.getFont(font: .interBold, size: 18))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom,10)
                        Spacer()
                            .frame(height: 20)
                        Button("Invest Today") {
                            print("Button tapped!")
                        }
                        .font(.getFont(font: .interBold, size: 12))
                        .frame(width: 100,height: 30)
                        .foregroundColor(.blue)
                        .background(.white)
                        .cornerRadius(5)
                        Spacer()
                            .frame(height: 10)
                    }
                    .padding(.leading,20)
                }
                
        }
    }
}

struct HomeScreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenCardView(userName: "Tushar")
    }
}
