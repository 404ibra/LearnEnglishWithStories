//
//  SeeAnothersView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 5.07.2023.
//

import SwiftUI
import Kingfisher

struct SeeAnothersView: View {
    
    @ObservedObject private var ArticleVM = ArticleViewModel()
    
    let geometry = UIScreen.main.bounds
    
    init() {
        ArticleVM.getData()
    }
    
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170, maximum: 225))
    ]
    
    var body: some View{
     NavigationStack{
            ScrollView{
                LazyVGrid(columns: adaptiveColumns, spacing: 25){
                    ForEach(Array(ArticleVM.article.indices), id: \.self) { index in
               
                            NavigationLink {
                                StoryPreview(article: ArticleVM.article[index], index: index)
                            } label: {
                                ZStack{
                                    VStack{
                                            ZStack(alignment: .leading){
                                                KFImage(URL(string: ArticleVM.article[index].images))
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(height: geometry.width / 3.8)
                                                    .frame(width: geometry.width / 2.4)
                                                    .cornerRadius(8)
                                                   
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
                                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                        //ZStack
                                        Text("\(ArticleVM.article[index].name)")
                                            .font(.system(size: 16.5, weight: .light, design: .rounded))
                                            .foregroundColor(.black)
                                    }
                                }//Label inside VStack
                            }

                        
                    }
                }
            }.navigationTitle("Seviyenize Göre")
        }
    }
}

struct SeeAnothersView_Previews: PreviewProvider {
    static var previews: some View {
        SeeAnothersView()
    }
}
