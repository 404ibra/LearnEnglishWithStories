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
        NavigationStack{
            
            VStack(alignment: .leading, spacing: 0){
                HStack {
                    Text(HeadlineText)
                        .FeaturedStoriesHeadline()
                        //.foregroundColor(.mainlightblue)
          
                    NavigationLink() {
                        SeeAnothersView()
                         
                    } label: {
              
                            Image(systemName: "chevron.right")
                                .font(.system(size: 15))
                                .padding(.trailing, 3)
                     
                    }


                    Spacer()
                   
                }//HStack
                .padding(.horizontal, 16)

                .frame(width: DeviceSize.size.width, height: 50)
                .background(.white)
                    FeatuderImages()
                }
                
        }
        
    }
}


struct FeaturedNewsiew: View {
    
    let DeviceSize = UIScreen.main.bounds
    let HeadlineText: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack {
                Text(HeadlineText)
                    .FeaturedStoriesHeadline()
                Image(systemName: "chevron.right")
                    .font(.system(size: 15))
                    .padding(.trailing, 3)
                Spacer()
            }
                    .padding(.horizontal, 16)
                
                    .frame(width: DeviceSize.size.width, height: 50)
                    .background(.white)
                FeaturedNews()
            }
            
            
        }
    }
    
    
    

