//
//  ContinueSection.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI

struct ContinueSection: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Kaldığın Yerden Devam Et")
                .FeaturedStoriesHeadline()
            ZStack(alignment: .bottom){
                Image("istanbul_img")
                    .resizable()
                    .frame(height: 160)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .cornerRadius(15)
                ZStack(alignment: .bottomLeading){
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.red.opacity(0.8))
                        .frame(height: 50)
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                    Text("Istanbul'u Keşfediyoruz")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 16)

                }
                   
            }
        }//VStack
        .padding(.vertical, 16)
    }
}

struct ContinueSection_Previews: PreviewProvider {
    static var previews: some View {
        ContinueSection()
    }
}
