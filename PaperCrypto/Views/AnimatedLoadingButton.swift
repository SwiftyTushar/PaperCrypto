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
    
    var title:String
    @State var buttonClicked = false
    @Binding var loading:Bool
    var action:() -> Void
    var body: some View {
        HStack(spacing:-10){
            Spacer()
            RoundedRectangle(cornerRadius: loading ? 40 : 20 )
                .foregroundColor(Color.appColorBlue)
                .frame(width: loading ? 60 : .infinity,height: 60)
                .overlay {
                    if loading{
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
                        loading = true
                    }
                }
            Spacer()
        }
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
