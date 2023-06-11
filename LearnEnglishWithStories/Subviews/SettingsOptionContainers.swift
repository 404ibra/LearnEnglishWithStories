//
//  SettingsOptionContainers.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.06.2023.
//

import SwiftUI

struct SettingsOptionContainers: View {
    @Environment(\.colorScheme) var colorScheme
    
    let size = UIScreen.main.bounds.size
    var buttontext: String
    var imagename: String
    var systemIcon: Bool
    var iconcolor: Color
    
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: size.width * 0.75)
                .frame(height: 48)
                .cornerRadius(12)
                .foregroundColor(colorScheme == .light
                                 ? .white
                                 : Color(hex: "#184b74"))
                .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 2.6)
           
                
            HStack{
                    if !systemIcon {
                        Image(imagename)
                                .resizable()
                                .frame(height: 30)
                                .frame(width: 30)
                                .padding(.horizontal, 16)
                    }else {
                        Image(systemName: imagename)
                           .resizable()
                           .frame(height: 24)
                           .frame(width: imagename == "envelope" ? 28 : 24)
                           .foregroundColor(iconcolor)
                           .padding(.horizontal, 16)
                    }
                    Text(buttontext)
                        .SettingsButtonFont()
 
                
                //to do
             /*   Image(systemName: "chevron.forward")
                    .foregroundColor(.orange)
                    .padding(.trailing, 16) */
               
            }
          
        }//ZStack
        .padding(.bottom, 12)
    }
}

