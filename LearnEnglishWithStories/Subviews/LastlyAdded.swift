//
//  LastlyAdded.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 15.06.2023.
//

import SwiftUI

struct LastlyAdded: View {
    var body: some View {
        @StateObject var MainVM = MainVievModel()
        
        let size = UIScreen.main.bounds
        let StoryVM = Story.stories
        NavigationStack{
            ScrollView(.horizontal, showsIndicators:  false) {
                HStack{
                    ForEach(StoryVM.reversed().prefix(1)) { index in
                        NavigationLink {
                            StoryScreen(storiesIndex: index.storynumber)
                        } label: {
                            ZStack{
                                VStack{
                                    ZStack(alignment: .bottom){
                                        Image(index.images)
                                            .resizable()
                                            .frame(height: 207)
                                            .frame(width: 249)
                                            .cornerRadius(12)
                                            .padding(.trailing, 6)
                                        ZStack(alignment: .center){
                                            Rectangle()
                                                .foregroundColor(.mainorange)
                                                .frame(height: 60)
                                                .frame(width: 249)
                                               
                                                
                                            //.indigo.opacity(0.5)
                                                .roundedCornerRectangle(radius: 12, corners: [.bottomRight, .bottomLeft])
                                                .padding(.trailing, 6)
                                            Text(index.level)
                                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                    //ZStack
                                    Text(index.name)
                                        .font(.system(size: 18, weight: .light, design: .rounded))
                                }
                            }//Label inside VStack

                            }
                    }
                }//HStack
                .padding(.leading, 16)
                //Hstack
            }//scrollview
        }//NavStack


        }//View
    }


struct LastlyAdded_Previews: PreviewProvider {
    static var previews: some View {
        LastlyAdded()
    }
}