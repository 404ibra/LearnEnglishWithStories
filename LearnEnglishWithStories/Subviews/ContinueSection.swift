//
//  ContinueSection.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI

struct ContinueSection: View {
    @StateObject private var MainVM = MainVievModel()
    var body: some View {
        VStack(alignment: .leading){
            Text("Kaldığın Yerden Devam Et")
                .FeaturedStoriesHeadline()
            ZStack(alignment: .bottom){
                Image("istanbul_img")
                    .resizable()
                    .frame(height: 230)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .cornerRadius(12)
                ZStack(alignment: .bottomLeading){
                    Rectangle()
                        .foregroundColor(.red.opacity(0.8))
                        .frame(height: 60)
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .roundedCornerRectangle(radius: 12, corners: [.bottomLeft, .bottomRight])

                    Text("Istanbul'u Keşfediyoruz")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 16)
                }
            }
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
        }
    }
    //VStack
}
   


struct ContinueSection_Previews: PreviewProvider {
    static var previews: some View {
        ContinueSection()
    }
}
