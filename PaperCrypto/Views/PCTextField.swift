//
//  PCTextField.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 04/02/24.
//

import SwiftUI

struct PCTextField: View {
    var placeHolder:String
    @Binding var text:String
    var keyboardType:UIKeyboardType
    var capitalization:TextInputAutocapitalization = .never
    var leadingImage:Image = Image(systemName: "person")
    var isPasswordField:Bool = false
    var shouldHideLeadingImage = false
    var isAmountTextField = false
    var body: some View {
        VStack{
            HStack(spacing:10){
                if !shouldHideLeadingImage{
                    leadingImage
                        .resizable()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.gray)
                        .padding(.leading,10)
                }
                if isPasswordField{
                    SecureField("Password", text: $text)
                        .padding(.vertical,20)
                } else {
                    if isAmountTextField{
                        TextField(placeHolder, text: $text)
                            .font(.getFont(font: .interMedium, size: 16))
                            .keyboardType(keyboardType)
                            .textInputAutocapitalization(capitalization)
                            .autocorrectionDisabled()
                            .onSubmit {
                                print("Submi button clicked")
                            }
                            .submitLabel(.done)
                            .padding(.horizontal,shouldHideLeadingImage ? 8 : 0)
                            .padding(.vertical)
                    } else {
                        TextField(placeHolder, text: $text)
                            .font(.getFont(font: .interMedium, size: 16))
                            .keyboardType(keyboardType)
                            .textInputAutocapitalization(capitalization)
                            .autocorrectionDisabled()
                            .onSubmit {
                                print("Submi button clicked")
                            }
                            .submitLabel(.done)
                            .padding(.horizontal,shouldHideLeadingImage ? 8 : 0)
                            .padding(.vertical)
                    }

                        
                        
                        //.padding(.vertical,15)
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray.opacity(0.5),lineWidth: 2)
            }
            
        }
    }
}

struct PCTextField_Previews: PreviewProvider {
    static var previews: some View {
        PCTextField(placeHolder: "My Place Holder", text: .constant(""), keyboardType: .emailAddress,shouldHideLeadingImage: true)
            .padding()
    }
}
