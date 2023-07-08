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
                        .font(.title)
                }

                
            }.padding(.horizontal, 16)
                .padding(.vertical, 16)
                .foregroundColor(.gray)
            Spacer()

         
                
           Text(" Eğlenceli ve bilgilendirici içeriklerle dil öğrenin")
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .padding(.bottom,32)
            Props()
 
      
            Spacer()
            Text("Yıllık üyelik sadece ₺599.99 (₺50.00/Ay)")
           
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: 190,  height: 60)
                        .foregroundColor(.mainorange.opacity(0.9))
                        .cornerRadius(20)
                    Text("Devam Et")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
            }
            Text("Dilediğin zaman iptal et")
                .font(.system(size: 14, weight: .light))
                .padding(.bottom,32)
            

            
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
                    .foregroundColor(.mainorange)
                Text("Yüzlerce ve yeni içeriklere anında erişim")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                Spacer()
            }.padding(.horizontal, 16)
                .padding(.bottom, 3)
            Divider()
            HStack{
                Image(systemName: "shield.slash")
                    .font(.system(size: 17))
                    .foregroundColor(.mainorange)
                Text("Reklamsız deneyim")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                Spacer()
            }.padding(.horizontal, 16)
                .padding(.bottom, 5)
            Divider()
            HStack{
                Image(systemName: "pin.square")
                    .font(.system(size: 17))
                    .foregroundColor(.mainorange)
                Text("Sınırsız not alma olanağı")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                Spacer()
            }.padding(.horizontal, 16)
                .padding(.bottom, 5)
            Divider()
            HStack{
                Image(systemName: "character.book.closed")
                    .font(.system(size: 17))
                    .foregroundColor(.mainorange)
                Text("Bilmediğin kelimelerin çevirileri")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                Spacer()
            }.padding(.horizontal, 16)
                .padding(.bottom, 5)
            Divider()
        }
    }
}
