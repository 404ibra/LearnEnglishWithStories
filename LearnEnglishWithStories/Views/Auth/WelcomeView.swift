//
//  WelcomeView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 12.07.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image("logoo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                                NavigationLink {
                                  
                    SignupType()
                } label: {
                    HStack{
                        Spacer()
                        Text("Kaydol")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                        Spacer()
                    } .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                    
                    
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                            
                                .foregroundColor(Color(hex: "6a95a3"))
                                .padding(.horizontal, 16)
                            
                        ).padding(.top, 5)
                }
                
                NavigationLink {
                    AuthenticationWithMail()
                } label: {
                    HStack{
                        Spacer()
                        Text("Giriş Yap")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(Color(hex: "6a95a3"))
                        Spacer()
                    } .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                    
                    
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(Color(hex: "6a95a3"), lineWidth: 0.3)
                                .padding(.horizontal, 16)
                            
                        )
                   
                    
                }
                LabelledDivider(label: "VEYA")
                Text("Misafir olarak devam et")
                    .font(.system(size: 15, weight: .light, design: .rounded))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "f4f2f7"))
                
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
