//
//  MyNotesView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.06.2023.
//

import SwiftUI
import Kingfisher

struct MyNotesView: View {
    @ObservedObject private var archiveVM = FavArticlesViewModel()
    
    init(){
        archiveVM.showFavArticles()
    }
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170, maximum: 225))
    ]
    
    
    let geometry = UIScreen.main.bounds.size
    var body: some View {
        
  
            ScrollView{
                LazyVGrid(columns: adaptiveColumns, spacing: 25){
                    ForEach(archiveVM.article!.indices, id: \.self){ index in
                        NavigationLink {
                            StoryPreview(article: archiveVM.article![index], index: index)
                        } label: {
                                ZStack{
                                    VStack{
                                            ZStack(alignment: .leading){
                                                KFImage(URL(string: archiveVM.article![index].images))
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(height: geometry.width / 3.8)
                                                    .frame(width: geometry.width / 2.4)
                                                    .cornerRadius(8)
                                                   
                                                if archiveVM.article![index].free {
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
                                          
                                        //ZStack
                                        Text("\(archiveVM.article![index].name["Spanish"]!)")
                                            .font(.system(size: 16.5, weight: .light, design: .rounded))
                                            .foregroundColor(.black)
                                    }
                                }//Label inside VStack
                            }
                        

                    
                }
            }
            }.padding(.top,24)
           
    
        
    }
}

struct MyNotesView_Previews: PreviewProvider {
    static var previews: some View {
        MyNotesView()
    }
}
