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
                    ForEach(ArticleVM.article.prefix(3).shuffled()) { index in
                        
                        NavigationLink {
                       //     StoryPreview(article: ArticleVM.article[index], index: index)
                        } label: {
                            ZStack {
                                VStack{
                                    
                                    ZStack(alignment: .leading){
                                        KFImage(URL(string: index.images))
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(height: 300)
                                            .frame(width: geometry.size.width * 0.9)
                                            .cornerRadius(8)
                                            .padding(.trailing, 6)
                                        if index.free {
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
                                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                        }
                                            
                                    }
                                   
                                    //ZStack
                                    Text(index.name)
                                        .font(.system(size: 18, weight: .light, design: .rounded))
                                }
                            }//Label inside VStack
                            
                        }
                    }
                }
                
                
                
                
                
                //HStack
                .padding(.leading, 16)
                //Hstack
                
                
                //  İNDEXLERİ TEK TEK GÖSTERMEK İÇİBN
                .onAppear {
                    //UIScrollView.appearance().isPagingEnabled = true
                }
                
            }//NavStack
            
            
        }//View
    }
}

struct LastlyAdded_Previews: PreviewProvider {
    static var previews: some View {
        LastlyAdded()
    }
}
