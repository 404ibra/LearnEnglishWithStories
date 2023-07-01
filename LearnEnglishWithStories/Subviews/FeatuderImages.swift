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
    @ObservedObject private var SoundVM: SoundManager
    
    init() {
        self.SoundVM = SoundManager()
        ArticleVM.getData()
    }
   

    var body: some View {
        
        
        NavigationStack{
            ScrollView(.horizontal, showsIndicators:  false) {
                LazyHStack{
                    if ArticleVM.isLoading == true {
                        ForEach(0...5, id: \.self) { dummy in
                            VStack(spacing: 0){
                                ZStack(alignment: .bottom){
                                    
                                   Rectangle()
                                        .frame(height: 155)
                                        .frame(width: 220)
                                        .cornerRadius(8)
                                        .padding(.trailing, 6)
                                        .foregroundColor(.mainorange.opacity(0.6))
                                    
                                    ZStack(alignment: .center){
                                        Rectangle()
                                            .foregroundColor(Color(hex: "fa6c38").opacity(0.8))
                                            .frame(height: 30)
                                            .frame(width: 220)
                                            .roundedCornerRectangle(radius: 12, corners: [.bottomRight, .bottomLeft])
                                            .padding(.trailing, 6)
                                        
                                        Text("Brush Level")
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                            .foregroundColor(.white)
                                    }
                                }
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                //ZStack
                                Text("Brush")
                                    .font(.system(size: 18, weight: .light, design: .rounded))
                            }
                        }
                        .redacted(reason: .placeholder)
                    } else {
                        
                        ForEach(Array(ArticleVM.article.indices), id: \.self) { index in
                            
                            NavigationLink {
                               /* StoryScreen(articleIndex:index, article: ArticleVM.article[index])*/
                                StoryPreview(article: ArticleVM.article[index])
                            } label: {
                                ZStack{
                                    VStack{
                                      
                                            ZStack(alignment: .leading){
                                                
                                                KFImage(URL(string: ArticleVM.article[index].images))
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(height: 155)
                                                    .frame(width: 220)
                                                    .cornerRadius(8)
                                                    .padding(.trailing, 6)
                                                
                                                ZStack{
                                                    Rectangle()
                                                        .frame(width: 20, height: 60)
                                                        .foregroundColor(.white.opacity(0.75))
                                                        .alignH(alignment: .leading)
                                                    Text("Ücretsiz")
                                                        .font(.system(size: 10, weight: .light, design: .rounded))
                                                        .foregroundColor(.black)
                                                    
                                                        .rotationEffect(.degrees(90))
                                                        .alignH(alignment: .leading)
                                                        .padding(.leading, -8)
                                                    
                                                }}
                                            
                                       /*     ZStack(alignment: .center){
                                                 Rectangle()
                                                     .foregroundColor(Color(hex: "fa6c38").opacity(0.8))
                                                     .frame(height: 30)
                                                     .frame(width: 220)
                                                     .roundedCornerRectangle(radius: 12, corners: [.bottomRight, .bottomLeft])
                                                     .padding(.trailing, 6)
                                                 
                                                 Text(ArticleVM.article[index].level)
                                                     .font(.system(size: 18, weight: .bold, design: .rounded))
                                                     .foregroundColor(.white)
                                             }*/
                                        
                                            
                                       
                                        
                                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                        //ZStack
                                        Text("\(ArticleVM.article[index].name) (\(ArticleVM.article[index].level))")
                                            .font(.system(size: 16.5, weight: .light, design: .rounded))
                                            .foregroundColor(.black)
                                    }
                                }//Label inside VStack
                                
                            }//label last
                        }// for each loop
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
