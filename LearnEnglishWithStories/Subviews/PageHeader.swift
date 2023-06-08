//
//  PageHeader.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI

struct PageHeader: View {
    var PageName: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Rectangle()
                .frame(height: 160)
                .foregroundColor(Color(hex: "#184b74"))
            HStack{
                Text(PageName)
                    .font(.system(size: 28, weight: .bold ,design: .rounded))
                    .foregroundColor(.white)
                Spacer()

            }//HStack
            .padding(.leading, 16)
            .padding(.trailing,16)
            .padding(.bottom, 32)
        }
    }
}


/*
 
 Text("Keşfet")
     .font(.system(size: 20, weight: .semibold ,design: .rounded))
     .foregroundColor(.orange)
     .padding(.horizontal, 13)
     .padding(.vertical, 6.5)
     .overlay(
         RoundedRectangle(cornerRadius: 10)
             .stroke(.blue, lineWidth: 2)
     )
     .background(
         RoundedRectangle(cornerRadius: 10)
             .fill(Color.clear)
     )
 
 */