//
//  ArticleHeadline.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 26.06.2023.
//

import SwiftUI


struct ArticleHeadline: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    
    let articleName: String
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .frame(height: 100)
                .foregroundColor(colorScheme == .dark
                                 ? .maindarkblue
                                 : .white
                )
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image(systemName: "arrow.backward.circle")
                        .resizable()
                        .frame(height: 30)
                        .frame(width: 30)
                        .foregroundColor(Color(hex: "fa6c38"))
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    
                    Spacer()
                    
                    Button {
                        //TO DO
                    } label: {
                        Text("Sayfa Ayarları")
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .foregroundColor(Color(hex: "fa6c38"))
                            .onTapGesture {
                                //self.pageSettings = true
                            }
                    }
                }
                
                HStack{
                    Text(articleName)
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(.mainorange)
                    Text("(Ortalama 15 dakika)")
                        .font(.system(size: 14.5, weight: .light, design: .rounded))
                        .foregroundColor(.gray.opacity(0.8))
                        .padding(.leading,15)
                }
                .alignH(alignment: .leading)
                .padding(.top, 25)
            }
            .padding(.horizontal, 24)
            .padding(.top, 30)
        }
    }
}
struct ArticleHeadline_Previews: PreviewProvider {
    static var previews: some View {
        ArticleHeadline(articleName: "Tur")
    }
}
