//
//  AnimatedLoadingButton.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 06/02/24.
//

import SwiftUI

class AnimationButtonTimeManager{
    
}

struct AnimatedLoadingButton: View {
    @State var buttonClicked = false
    
    var title:String
    var action:() -> Void
    var body: some View {
        HStack(spacing:-10){
            Spacer()
            RoundedRectangle(cornerRadius: buttonClicked ? 40 : 20 )
                .foregroundColor(Color.appColorBlue)
                .frame(width: buttonClicked ? 60 : .infinity,height: 60)
                .overlay {
                    if buttonClicked{
                        ProgressView()
                            .frame(width: 30,height: 40)
                            .tint(.white)
                            
                    } else {
                        Text(title)
                            .foregroundColor(.white)
                            .font(.getFont(font: .interMedium, size: 20))
                    }
                }
                .onTapGesture {
                    action()
                    withAnimation(Animation.easeOut(duration: 0.5)) {
                        buttonClicked.toggle()
                    }
                }
            Spacer()
        }
    }
}

struct AnimatedLoadingButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedLoadingButton(title: "Sample"){
            
        }
            .frame(height: 60)
            .padding()
    }
}
