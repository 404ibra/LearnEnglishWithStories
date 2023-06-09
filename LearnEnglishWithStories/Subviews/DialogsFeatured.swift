//
//  DialogsFeatured.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 7.06.2023.
//

import SwiftUI

struct DialogsFeatured: View {

    let HeadlineText: String
    var body: some View {
        VStack {
            HStack {
                Text(HeadlineText)
                    .FeaturedStoriesHeadline()
                Spacer()
                HStack{
                    Text("Tümünü Görüntüle")
                        .SeeAll()
                    Image(systemName: "arrow.right")
                        //.foregroundColor(.white)
                }
            }//HStack
            .padding(.horizontal, 16)
            ExtractedView()
        }//scrollview
    }
}

struct DialogsFeatured_Previews: PreviewProvider {
    static var previews: some View {
        DialogsFeatured(HeadlineText: "Diyaloglar")
    }
}

struct ExtractedView: View {
    let size = UIScreen.main.bounds
    var body: some View {
        ScrollView(.horizontal, showsIndicators:  false) {
            HStack{
                ForEach(0..<3) { index in
                    ZStack(alignment: .bottom){
                        Image("featured_img_\(index)")
                            .resizable()
                            .frame(height: size.height/4)
                            .frame(width: size.width/2.5)
                            .cornerRadius(12)
                            .padding(.trailing, 6)
                        ZStack(alignment: .center){
                            Rectangle()
                                .frame(height: size.height / 12)
                                .frame(width: size.width/2.5)
                                .padding(.trailing, 6)
                                .foregroundColor(.indigo.opacity(0.5))
                            Text("ABD'yi keşfedin")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                        
                    }
                    .onTapGesture {
                        print("dsadsa")
                    }
                }
            }.padding(.leading, 16)
            
            //Hstack
        }
    }
}
