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
        VStack(alignment: .leading, spacing: 0){
            HStack {
                Text(HeadlineText)
                    .FeaturedStoriesHeadline()
                    //.foregroundColor(.mainlightblue)
                Image(systemName: "chevron.right")
                    .font(.system(size: 15))
                    .padding(.trailing, 3)
                Spacer()
               
            }//HStack
            .padding(.horizontal, 16)
            .frame(width: DeviceSize.size.width, height: 80)
            .background(.white)
            LastlyAdded()
                .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 4)
        }
    }
}
