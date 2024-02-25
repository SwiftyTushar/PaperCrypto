//
//  AnimatedLoadingButton.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 06/02/24.
//

import SwiftUI
import UIKit

struct AnimatedLoadingButton: View {
    
    var title:String
    @State var buttonClicked = false
    @Binding var loading:Bool
    var action:() -> Void
    var body: some View {
        GeometryReader(content: { geometry in
            HStack(spacing:-10){
                Spacer()
                RoundedRectangle(cornerRadius: loading ? 40 : 8 )
                    .foregroundColor(Color.appColorBlue)
                    .frame(width: loading ? 60 : geometry.size.width)
                    .overlay {
                        if loading{
                            ProgressView()
                                .frame(width: 30,height: 40)
                                .tint(.white)
                                
                        } else {
                            Text(title)
                                .foregroundColor(.white)
                                .font(.getFont(font: .interMedium, size: 18))
                        }
                    }
                    .onTapGesture {
                        action()
                        withAnimation(Animation.easeOut(duration: 0.5)) {
                            loading = true
                        }
                    }
                Spacer()
            }
        })
        .frame(height: 45)
        
    }
}

struct AnimatedLoadingButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedLoadingButton(title: "Sample", loading: .constant(false)){
            
        }
            .frame(height: 60)
            .padding()
    }
}
