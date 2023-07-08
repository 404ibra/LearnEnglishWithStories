//
//  PopularView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.07.2023.
//



import SwiftUI
import Kingfisher


struct PopularView: View {
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
                             /*   StoryScreen(articleIndex:index, article: ArticleVM.article[index])*/
                                StoryPreview(article: ArticleVM.article[index], index: index)
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
                                                 
                                                
                                                if ArticleVM.article[index].free {
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
                                                    }
                                                }
                                                
                                                
                                                
                                            }
                                            
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
                                        HStack{
                                            Text(String(index + 1))
                                                .font(.system(size: 28, weight: .medium, design: .rounded))
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 5)
                                            VStack(alignment: .leading){
                                                Text(ArticleVM.article[index].name)
                                                    .font(.system(size: 14, weight: .light))
                                                    .foregroundColor(.black)
                                                Text("\(ArticleVM.article[index].subject) · \(ArticleVM.article[index].duration) ")
                                                    .font(.system(size: 13, weight: .light))
                                                    .foregroundColor(.gray)
                                            }
                                            Spacer()
                                        }
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




struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView()
    }
}
