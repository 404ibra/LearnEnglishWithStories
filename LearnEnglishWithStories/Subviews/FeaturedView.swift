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
        VStack(spacing: 0){
            HStack {
                Text(HeadlineText)
                    .FeaturedStoriesHeadline()
                    //.foregroundColor(.mainlightblue)
                Spacer()
                HStack{
                    Text("Tümünü Görüntüle")
                        .SeeAll()
                      
                    Image(systemName: "chevron.right")
                        //.foregroundColor(.white)
                }
            }//HStack
            .padding(.horizontal, 16)

            .frame(width: DeviceSize.size.width, height: 50)
            .background(.white)
                FeatuderImages()
            }
            
        
    }
}


struct FeaturedNewsiew: View {

    let DeviceSize = UIScreen.main.bounds
    let HeadlineText: String
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Text(HeadlineText)
                    .FeaturedStoriesHeadline()
                Spacer()
                HStack{
                    Text("Tümünü Görüntüle")
                        .SeeAll()
                      
                    Image(systemName: "chevron.right")
                        //.foregroundColor(.white)
                }
            }//HStack
            .padding(.horizontal, 16)

            .frame(width: DeviceSize.size.width, height: 50)
            .background(.white)
                FeaturedNews()
            }
            
        
    }
}



