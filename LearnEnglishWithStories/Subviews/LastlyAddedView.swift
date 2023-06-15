//
//  LastlyAddedView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 15.06.2023.
//

import SwiftUI

 
struct LastlyAddedView: View {
    let DeviceSize = UIScreen.main.bounds
    let HeadlineText: String
    var body: some View {
        VStack{
            HStack {
                Text(HeadlineText)
                    .FeaturedStoriesHeadline()
                    .foregroundColor(.mainlightblue)
                Spacer()
                HStack{
                    Text("Tümünü Görüntüle")
                        .SeeAll()
                      
                    Image(systemName: "arrow.right")
                        //.foregroundColor(.white)
                }
            }//HStack
            .padding(.horizontal, 16)
            LastlyAdded()
        }
    }
}
