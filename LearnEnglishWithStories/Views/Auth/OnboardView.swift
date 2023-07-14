//
//  OnboardView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.07.2023.
//

import SwiftUI

struct OnboardView: View {
    @State private var tabIndex: Int = 0
    @State var offset: CGFloat = 0
    var colors : [Color] = [.maindarkblue, .pink, .yellow]
    var body: some View {
        NavigationStack{
            VStack{
                
                
                OnboardingTabView(tabIndex: tabIndex, offset: $offset)
                    .padding(.top, 30)
                Spacer()
                
                if tabIndex < 2 {
                    Button {
                        tabIndex += 1
                        withAnimation(.default) {
                            offset += UIScreen.main.bounds.size.width
                        }
                    } label: {
                        HStack{
                            Spacer()
                            Text("İlerle")
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            Spacer()
                        }
        
                        .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                        
                        
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                
                                    .foregroundColor(Color(hex: "6a95a3"))
                                    .padding(.horizontal, 16)
                                
                            ).padding(.top, 5)
                    }
                    
                }
                
                
                if tabIndex == 2 {
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
                
                /*
                 ZStack {
                 Circle()
                 .stroke(
                 Color.pink.opacity(0.5),
                 lineWidth: 10
                 ).frame(width: 30)
                 Circle()
                 .trim(from: 0, to: 0.33) // 1
                 .stroke(
                 Color.pink,
                 lineWidth: 10
                 ).frame(width: 30)
                 .rotationEffect(.degrees(-90))
                 }*/
            }
                .navigationBarTitleDisplayMode(.inline)
             .toolbar {
             
             ToolbarItem(placement: .navigationBarTrailing) {
             
             
                 Button {
                     if tabIndex != 2 {
                         offset = CGFloat((2-tabIndex))*(UIScreen.main.bounds.size.width)

                     } else {
                         offset = 2*(UIScreen.main.bounds.size.width)
                     }
                        
                     tabIndex = 2
                     
                 } label: {
                     Text("Atla")
                     .font(.system(size: 15, weight: .light, design:.rounded))
                     
                     .foregroundColor(.gray)
                     .padding(.horizontal, 16)
                     
                 }

             
             }
             
             }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "f4f2f7"))
            
        }
        
        
    }
    
    }
    
  


extension View{
    func getWidth()-> CGFloat {
        return UIScreen.main.bounds.width
    }
}




struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
//5b9c7d


//95bbb8 green
