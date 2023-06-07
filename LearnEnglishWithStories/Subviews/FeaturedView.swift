//
//  FeaturedView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 3.06.2023.
//

import SwiftUI

struct FeaturedView: View {
    let DeviceSize = UIScreen.main.bounds
    let HeadlineText: String
    var body: some View {
        VStack{
            HStack {
                Text(HeadlineText)
                    .FeaturedStoriesHeadline()
                Spacer()
                HStack{
                    Text("Tümünü gör")
                        .SeeAll()
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
            }//HStack
            .padding(.horizontal, 16)
            FeatuderImages()
        }
    }
}

