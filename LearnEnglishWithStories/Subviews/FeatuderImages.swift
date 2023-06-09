//
//  HomePage.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.05.2023.
//

import SwiftUI

struct FeatuderImages: View {
    var body: some View {
        let size = UIScreen.main.bounds
        let StoryVM = Story.stories
        ScrollView(.horizontal, showsIndicators:  false) {
            HStack{
                ForEach(StoryVM) { index in
                    VStack{
                        ZStack(alignment: .bottom){
                            Image(index.images)
                                .resizable()
                                .frame(height: 215)
                                .frame(width: 230)
                                .cornerRadius(12)
                                .padding(.trailing, 6)
                            ZStack(alignment: .center){
                                Rectangle()
                                    .frame(height: 60)
                                    .frame(width: 230)
                                    .padding(.trailing, 6)
                                    .foregroundColor(Color(hex: "fa6c38").opacity(0.8))
                                //.indigo.opacity(0.5)
                                    .roundedCornerRectangle(radius: 12, corners: [.bottomLeft, .bottomRight])
                                Text(index.level)
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                        }//ZStack
                        Text(index.name)
                            .font(.system(size: 18, weight: .light, design: .rounded))
                    }
                }
            }//HStack
            .padding(.leading, 16)
            //Hstack
        }//scrollview
        }//View
    }


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        FeatuderImages()
    }
}
