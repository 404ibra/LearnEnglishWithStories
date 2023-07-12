//
//  PaywallView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 3.07.2023.
//

import SwiftUI

struct PaywallView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let geo = UIScreen.main.bounds
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                }

                
            }.padding(.horizontal, 16)
                .padding(.top, 16)
                .foregroundColor(.gray)
     

         Image("paywall")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geo.width , height: geo.height * 0.3)
                
           Text("Özgürce öğrenmenin keyfini çıkarın")
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .padding(.bottom,15)
                .alignH(alignment: .leading)
                .padding(.horizontal, 16)
               
            Props()
 
            Spacer()
           
            Text("Yıllık üyelik sadece ₺599.99 (₺50.00/Ay)")
           
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: geo.size.width * 0.85 ,height: 55)
                        .foregroundColor(Color(hex: "227d8f"))
                        .cornerRadius(8)
                    Text("Devam Et")
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                }

            }
            Text("Dilediğin zaman iptal et")
                .font(.system(size: 14, weight: .light))
                .padding(.bottom,32)
                .foregroundColor(Color(hex: "227d8f"))
            

            
        }                .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "f4f2f7"))

    }
}

struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView()
    }
}

struct Props: View {
    var body: some View {
        VStack{
            
            HStack{
                Image(systemName: "square.stack.3d.down.right")
                    .font(.system(size: 17))
                    .foregroundColor(Color(hex: "fa705e"))
                Text("Yüzlerce ve yeni içeriklere anında erişim")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                Spacer()
            }.padding(.horizontal, 16)
                .padding(.bottom, 3)
            Divider()
            HStack{
                Image(systemName: "shield.slash")
                    .font(.system(size: 17))
                    .foregroundColor(Color(hex: "fa705e"))
                Text("Reklamsız deneyim")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                Spacer()
            }.padding(.horizontal, 16)
                .padding(.bottom, 5)
            Divider()
            HStack{
                Image(systemName: "pin.square")
                    .font(.system(size: 17))
                    .foregroundColor(Color(hex: "fa705e"))
                Text("Sınırsız not alma olanağı")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                Spacer()
            }.padding(.horizontal, 16)
                .padding(.bottom, 5)
            Divider()
            HStack{
                Image(systemName: "character.book.closed")
                    .font(.system(size: 17))
                    .foregroundColor(Color(hex: "fa705e"))
                Text("Bilmediğin kelimelerin çevirileri")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                Spacer()
            }.padding(.horizontal, 16)
                .padding(.bottom, 5)
            Divider()
        }
    }
}
