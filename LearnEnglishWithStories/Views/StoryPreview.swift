//
//  StoryPreview.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI
import Kingfisher


struct StoryPreview: View {
    @EnvironmentObject private var AuthVM: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var ArticleVM = ArticleViewModel()
    
 
    
    let geometry = UIScreen.main.bounds
    let article: Article
    
    init(article: Article) {
        self.article = article
        ArticleVM.getData()
    }
    let sentence: String = "hfghgfhgfhgfhgfhgfhgfhgdgh dgh  hfsgds dksajhjd ksajhdkl jsalkd jsal djsal djasl jdsald jsald jsalh fgaksjfanufıklasu nflıau "
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                GeometryReader { g in
                    ZStack(alignment: .bottom) {
                        ZStack{
                            
                            KFImage(URL(string: article.images))
                                .resizable()
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
                            Text(article.name)
                                .font(.system(size: 26, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.bottom, 1)
                            HStack{
                                Text("\(article.subject) ·")
                                Text(article.level)
                                Text("·\(article.duration)")
                                
                            }
                            .font(.system(size: 15, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.bottom, 0.1)
                            Button {
                                //print
                            } label: {
                                
                                
                                if AuthVM.currentUser?.isPremium ?? false {
                                    Text("Şimdi Oku")
                                        .font(.system(size: 19, weight: .semibold, design: .rounded))
                                        .foregroundColor(.black)
                                        .padding(.horizontal,32)
                                        .padding(.vertical, 12)
                                        .background(Color(hex: "eaeaec"))
                                        .cornerRadius(8)
                                } else if article.free {
                                    Text("Şimdi Oku")
                                        .font(.system(size: 19, weight: .semibold, design: .rounded))
                                        .foregroundColor(.black)
                                        .padding(.horizontal,32)
                                        .padding(.vertical, 12)
                                        .background(Color(hex: "eaeaec"))
                                        .cornerRadius(8)
                                } else {
                                    Text("Premium Ol")
                                        .font(.system(size: 19, weight: .semibold, design: .rounded))
                                        .foregroundColor(.black)
                                        .padding(.horizontal,24)
                                        .padding(.vertical, 12)
                                        .background(Color(hex: "eaeaec"))
                                        .cornerRadius(8)
                                }
                               
                            }//Button
                            
                           
                     
                            Text(article.summary)
                                .multilineTextAlignment(.leading)
                                .frame(width: UIScreen.main.bounds.width)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                            
                        }.padding(.vertical, 35)
                    }
                    .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                    .frame(width: geometry.size.width,height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height * 0.65 + g.frame(in: .global).minY : UIScreen.main.bounds.height * 0.65)
                }//Geo reader
                .frame(height: UIScreen.main.bounds.height * 0.65)
                VStack(alignment: .leading){
                    HStack{
                        Text("Yeni Keşifler")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            
                        Image(systemName: "chevron.right")
                    }
                    .alignH(alignment: .leading)
                    .frame(width: geometry.size.width, height: 50)
                    .background(.white)

                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
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
                                                        .frame(height: 120)
                                                        .frame(width: 180)
                                                        .cornerRadius(8)
                                                        .padding(.trailing, 6)
                                                    
                                                    ZStack{
                                                        Rectangle()
                                                            .frame(width: 16, height: 45)
                                                            .foregroundColor(.white.opacity(0.75))
                                                            .alignH(alignment: .leading)
                                                        Text("Ücretsiz")
                                                            .font(.system(size: 10, weight: .light, design: .rounded))
                                                            .foregroundColor(.black)
                                                        
                                                            .rotationEffect(.degrees(90))
                                                            .alignH(alignment: .leading)
                                                            .padding(.leading, -10)
                                                        
                                                    }
                                                    
                                                   
                                                    
                                                }
                                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                            //ZStack
                                           
                                        }
                                    }//Label inside VStack
                                    
                                }//label last
                            }// for each loop
                        }
                    }
                }.padding(.leading, 16)
                VStack{
                    Text("İçerik")
                        .alignH(alignment: .leading)
                        .font(.system(size: 21, weight: .semibold, design: .rounded))
                        .padding(.horizontal, 16)
                        .padding(.top, 7)
                        .padding(.bottom, 8)
                    ForEach(article.contentnames, id:\.self) { content in
                        Text(content)
                            .font(.system(size: 16, weight: .light, design: .rounded))
                    }
                    .alignH(alignment: .leading)
                    .padding(.horizontal, 16)
                }//VStack
            }//Scrollview
            .navigationBarBackButtonHidden(true)
          
           
        }
 
        
        .toolbar() {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    //
                    presentationMode.wrappedValue.dismiss()
                } label: {
                   
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    
                }

            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //
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
        }
        /*
        .overlay(
            ZStack{
               
                Text("Featured")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
            }
                .frame(height: 70)
                .frame(maxHeight: .infinity, alignment: .top)
        )*/
        
    }}


/*
 ZStack{
     NavigationStack {
             VStack{
                 StoryPreviewHeader(PageName: article.name, isActiveted: $isActivate)
                 ScrollView {
                     HStack{
                         Text(article.level)
                             .font(.system(size: 18, weight: .light, design: .rounded))
                             .alignH(alignment: .leading)
                         Spacer()
                         Image(systemName: "bookmark")
                     }
                     .padding(.horizontal, 16)
                     
                     
                     if article.images != nil {
                         KFImage(URL(string: (article.images)))
                             .resizable()
                             .frame(height: 240)
                             .frame(width: UIScreen.main.bounds.width *  0.95)
                             .cornerRadius(10)
                             .padding(.top, 16)
                     } else {
                         ProgressView()
                     }
                     Text("Bu serimizle birlikte üç imparatorluğun başkentliğni yapmış avrupanın en büyük metropolü olan İstanbul'un geçmişine ve geleceğine ışık tutuyoruz")
                         .DescriptionFont()
                         .padding(.horizontal, 10)
                         .padding(.vertical, 5)
                         
                    
                     Text("İçerik:")
                         .alignH(alignment: .leading)
                         .padding(.horizontal, 16)
                         .font(.system(size: 17, weight: .medium, design: .rounded))
                    
                     ForEach(article.contentnames, id: \.self) { contentnames in
                         Text("-\(contentnames)")
                     }
                     .alignH(alignment: .leading)
                     .padding(.horizontal, 16)
                     //ReadButton(isLocked: isLocked)
             }
         }
         .navigationBarBackButtonHidden(true)
         .ignoresSafeArea()
     }//NavigationStack
     if isActivate && AuthVM.currentUser?.isPremium == false {
               DialogContainer(isActivated: $isActivate)
     }else {
Text("prew")            }
 }//ZStack
 
 
 */
