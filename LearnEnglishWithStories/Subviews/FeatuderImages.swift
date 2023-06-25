//
//  HomePage.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.05.2023.
//

import SwiftUI
import Kingfisher


struct FeatuderImages: View {
    @StateObject var MainVM = MainVievModel()
    @ObservedObject private var ArticleVM = ArticleViewModel()
    
    
    init() {
        ArticleVM.getData()
    }
    
    let StoryVM = Story.stories
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators:  false) {
                LazyHStack{
                    ForEach(Array(ArticleVM.article.indices), id: \.self) { index in
                        NavigationLink {
                            //StoryScreen(storiesIndex: index.storynumber)
                            
                           // StoryPreview(index: index.storynumber)
                          //  StoryScreen(storiesIndex: index)
                          
                                
                            StoryScreen(articleIndex:index, articleData: ArticleVM.article[index].name, contentCount: ArticleVM.article[index].content.count, audioURL: ArticleVM.article[index].sounds[0])
                        } label: {
                            ZStack{
                                VStack{
                                    ZStack(alignment: .bottom){
                                        ZStack{
                                            Rectangle()
                                                .frame(height: 207)
                                                .frame(width: 249)
                                                .cornerRadius(12)
                                                .padding(.trailing, 6)
                                                .foregroundColor(.mainorange.opacity(0.6))

                                            KFImage(URL(string: ArticleVM.article[index].images))
                                                .resizable()
                                                .frame(height: 207)
                                                .frame(width: 249)
                                                .cornerRadius(12)
                                                .padding(.trailing, 6)
                                             

                                        }
                                        
                                        ZStack(alignment: .center){
                                            Rectangle()
                                                .foregroundColor(Color(hex: "fa6c38").opacity(0.8))
                                                .frame(height: 60)
                                                .frame(width: 249)
                                               
                                                
                                            //.indigo.opacity(0.5)
                                                .roundedCornerRectangle(radius: 12, corners: [.bottomRight, .bottomLeft])
                                                .padding(.trailing, 6)
                                            Text(ArticleVM.article[index].level)
                                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                    //ZStack
                                    Text(ArticleVM.article[index].name)
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
