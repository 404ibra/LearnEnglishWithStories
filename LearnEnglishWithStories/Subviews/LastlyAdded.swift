//
//  LastlyAdded.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 15.06.2023.
//

import SwiftUI
import Kingfisher



struct LastlyAdded: View {
    @StateObject var MainVM = MainVievModel()
    @ObservedObject private var ArticleVM = ArticleViewModel()
    
    let geometry = UIScreen.main.bounds
    
    init(){
        ArticleVM.getData()
    }
    
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators:  false) {
                
                HStack{
                    ForEach(ArticleVM.article.prefix(3).indices.shuffled(), id: \.self) { index in
                        NavigationLink {
                           StoryPreview(article: ArticleVM.article[index], index: index)
                        } label: {
                            ZStack {
                                VStack{
                                    ZStack(alignment: .leading){
                                        KFImage(URL(string: ArticleVM.article[index].images))
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(height: 300)
                                            .frame(width: geometry.size.width * 0.9)
                                            .cornerRadius(8)
                                            .padding(.trailing, 6)
                                             
                                        if ArticleVM.article[index].free {
                                            ZStack{
                                                Rectangle()
                                                    .frame(width: 28, height: 80)
                                                    .foregroundColor(.white.opacity(0.75))
                                                    .alignH(alignment: .leading)
                                                
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
                                            
                                    }
                                   
                                    //ZStack
                         
                                }
                            }//Label inside VStack
                            
                        }
                    }
                }
                .padding(.leading, 16)
            }//NavStack
            
            
        }//View
    }
}

struct LastlyAdded_Previews: PreviewProvider {
    static var previews: some View {
        LastlyAdded()
    }
}
