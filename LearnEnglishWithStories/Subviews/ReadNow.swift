//
//  ReadNow.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 28.06.2023.
//

import SwiftUI
import Kingfisher


struct ReadNow: View {
    @EnvironmentObject private var AuthVM : AuthViewModel
    @ObservedObject private var ArticleVM = ArticleViewModel()
    @ObservedObject private var ArchiveVM = ArchiveViewModel()
    
    @State private var iconChange: Bool = false
    init(){
        ArticleVM.readnow()
    }
    
    
    @State var selectedIndex = 0
    let geometry = UIScreen.main.bounds
    var body: some View {
        
      
        NavigationStack{
           GeometryReader { g in
                TabView(selection: $selectedIndex){
                    ForEach(ArticleVM.readnowArticles.indices, id: \.self){ index in
                        NavigationLink {
                           StoryPreview(article: ArticleVM.readnowArticles[index], index: index) 
                        } label: {
                            ZStack(alignment: .bottom){
                                ZStack{
                                   KFImage(URL(string: ArticleVM.readnowArticles[index].images))  .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                                        startPoint: .top,
                                        endPoint: .center
                                    )
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .center
                                    )
                                }
                                VStack{
                                    Text(ArticleVM.readnowArticles[index].name)
                                        .font(.system(size: 23, weight: .semibold, design: .rounded))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 1)
                                    HStack{
                                        Text("\(ArticleVM.readnowArticles[index].subject) ·")
                                        Text(ArticleVM.readnowArticles[index].level)
                                        Text("·\(ArticleVM.readnowArticles[index].duration)")
                                        
                                    }
                                    .font(.system(size: 15, weight: .light, design: .rounded))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 0.1)
                                    Text(ArticleVM.readnowArticles[index].subject)
                                        .font(.system(size: 16, weight: .medium, design: .rounded))
                                        .padding(.horizontal, 60)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 0)
                                        .multilineTextAlignment(.center)
                                }.padding(.vertical, 35)
                            }.tag(index)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                    .frame(width: geometry.size.width,
                           height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height * 0.65 + g.frame(in: .global).minY : UIScreen.main.bounds.height * 0.65)
            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Şimdi Oku")
                    .font(.system(.title))
                    .bold()
                    .foregroundColor(.white)

            }
           /* ToolbarItem(placement: .navigationBarTrailing) {
         
                
               
             if AuthVM.currentUser!.favStories!.contains(ArticleVM.readnowArticles[selectedIndex].articleid) {
                    Button {
                        ArchiveVM.removeFavArticle(articleID: ArticleVM.readnowArticles[selectedIndex].articleid)
                        iconChange = false
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(
                                Circle()
                                    .foregroundColor(.gray.opacity(0.6))
                            )
                    }

                } else {
                    Button {
                        ArchiveVM.addFavArticle(articleID: ArticleVM.readnowArticles[selectedIndex].articleid)
                        iconChange = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(
                                Circle()
                                    .foregroundColor(.gray.opacity(0.6))
                            )
                    }
                }
                }*/
        }
        .onChange(of: iconChange, perform: { _ in
            Task { await AuthVM.fetchUser() }
        })
        
            //Geometry Reader
            .frame(width: geometry.size.width ,height: UIScreen.main.bounds.size.height * 0.65)
            //Şimdi Oku kısmı

    }
}
