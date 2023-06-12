//
//  ProfileViewOptionButtons.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 12.06.2023.
//

import SwiftUI

struct ProfileViewOptionButtons: View {
    let systemicon: String
    let buttontext: String
    
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(height: 60)
                .frame(width: 270)
                .foregroundColor(Color(hex: "FF9800").opacity(0.3))
                .cornerRadius(12)
            HStack(){
                Image(systemName: systemicon)
                    .font(.system(size: 22))
                    .foregroundColor(.brown)
                    .padding(.horizontal, 16)
                Text(buttontext)
                    .ProfileOptionButtonTextFont()
            }
        }//ZStack
    }
}

