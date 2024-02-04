//
//  HomeScreenCardView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI

struct HomeScreenCardView: View {
    var userName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16) // Apply corner radius here
                .foregroundColor(.blue)
                .frame(width: .infinity, height: 150)
            
            HStack {
                Spacer()
                Image("halfCircle")
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            .zIndex(1) // Move the image to the front
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: 20)
                
                Text("Welcome \(userName),")
                    .font(Font.getFont(font: .interMedium, size: 14))
                    .foregroundColor(.white)
                
                Spacer().frame(height: 10)
                
                Text("Make your first investment today")
                    .font(Font.getFont(font: .interBold, size: 18))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                
                Spacer().frame(height: 20)
                
                Button("Invest Today") {
                    print("Button tapped!")
                }
                .font(.getFont(font: .interBold, size: 12))
                .frame(width: 100, height: 30)
                .foregroundColor(.blue)
                .background(.white)
                .cornerRadius(5)
                
                Spacer().frame(height: 10)
            }
            .zIndex(2)
            .padding(.leading, 20)
        }
        .cornerRadius(16)
    }
}

struct HomeScreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenCardView(userName: "Tushar")
            .padding()
    }
}
