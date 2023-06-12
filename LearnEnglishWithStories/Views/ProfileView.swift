//
//  ProfileView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 7.06.2023.
//

import SwiftUI

struct ProfileView: View {
    let size = UIScreen.main.bounds.size
    var body: some View {
        
        VStack{
            PageHeader(PageName: "Profilim", searchicon: false)
            
                ScrollView{
                    LevelBar()
                    MedalView()
                    Text("Neler Yaptın")
                        .ProfileOptionButtonTextFont()
                        .alignH(alignment: .leading)
                        .padding(.leading, 16)
                        .padding(.vertical, 32)
                    VStack {
                        
                            Image("istanbul_img")
                                .resizable()
                                .frame(height: 240)
                                .frame(width: size.width * 0.93)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 3)
                                .alignH(alignment: .center)
                        
                        HStack{
                            Rectangle()
                                .frame(width: 1)
                                .frame(height: 200)
                                .cornerRadius(1)
                            Text("24 Haziran 2023")
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1.4))
                                .padding(.horizontal, 30)
                                
                        }.alignH(alignment: .leading)
                            .padding(.horizontal, 48)
                        //Hstack
                    }
                  
                    
                    
                    
            
            }//SCROLLView
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
