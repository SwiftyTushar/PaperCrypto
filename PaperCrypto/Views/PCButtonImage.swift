//
//  PCButtonImage.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 06/02/24.
//

import SwiftUI

struct PCButtonImage: View {
    var trailingImage:Image
    var title:String
    var action:(() -> Void)
    var body: some View {
        HStack{
            Text(title)
                .foregroundColor(.black.opacity(0.8))
                .font(.getFont(font: .interMedium, size: 18))
            Spacer()
            trailingImage
                .resizable()
                .frame(width: 20,height: 20)
                .foregroundColor(.black.opacity(0.8))
        }
        .padding()
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    }
}

struct PCButtonImage_Previews: PreviewProvider {
    static var previews: some View {
        PCButtonImage(trailingImage: Image(systemName:"person"), title: "Login", action: {
        })
            .padding()
    }
}
