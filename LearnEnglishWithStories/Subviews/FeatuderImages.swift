//
//  HomePage.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.05.2023.
//

import SwiftUI

struct FeatuderImages: View {
    var body: some View {
        @StateObject var MainVM = MainVievModel()
        
      
        let StoryVM = Story.stories
        NavigationStack{
            ScrollView(.horizontal, showsIndicators:  false) {
                HStack{
                    ForEach(StoryVM) { index in
                        NavigationLink {
                            
                            //StoryScreen(storiesIndex: index.storynumber)
                            
                           // StoryPreview(index: index.storynumber)
                            StoryScreen(storiesIndex: 0)
                          
                                
                        //    StoryScreen(storiesIndex: index.storynumber) hikayenin sayfası
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
                                                .foregroundColor(Color(hex: "fa6c38").opacity(0.8))
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


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        FeatuderImages()
    }
}
