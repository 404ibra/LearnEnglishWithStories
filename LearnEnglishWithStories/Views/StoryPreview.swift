//
//  StoryPreview.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI
import Kingfisher


struct StoryPreview: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject private var AuthVM: AuthViewModel
    @EnvironmentObject private var ArticleVM : ArticleViewModel
    
    @ObservedObject private var ArchiveVM = ArchiveViewModel()
    @ObservedObject var reward = Reward()
    @ObservedObject private var MainVM = MainVievModel()
    
    @State private var isSheetPresented = false
    @State private var insideChange: Int?
    @State private var iconChange: Bool?
   
    @State private var dialog: Bool = false
    
    let geometry = UIScreen.main.bounds
    let article: Article
    var index: Int
    

    
    init(article: Article, index: Int) {
        self.article = article
        self.index = index

    }


    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                ZStack{
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
                                    Text(article.name["Spanish"]!)
                                        .font(.system(size: 26, weight: .semibold, design: .rounded))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 1)
                                    HStack{
                                        Text("\(article.subject["Spanish"]!) ·")
                                        Text(article.level["Spanish"]!)
                                        Text("·\(article.duration)")
                                        
                                    }
                                    .font(.system(size: 15, weight: .light, design: .rounded))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 0.1)
                                    Button {
                                        //print
                                    } label: {
                                        
                                        
                                        if AuthVM.currentUser?.isPremium ?? false && index < ArticleVM.article.count {
                                            NavigationLink {
                                            
                   
                                        StoryScreen(articleIndex: article.storynumber , article: ArticleVM.article[index])
                                                
                                           
                                                
                                               
                                             
                                            } label: {
                                                Text("Şimdi Oku")
                                                    .font(.system(size: 19, weight: .semibold, design: .rounded))
                                                    .foregroundColor(.black)
                                                    .padding(.horizontal,32)
                                                    .padding(.vertical, 12)
                                                    .background(Color(hex: "eaeaec"))
                                                    .cornerRadius(8)
                                            }

                                        } else if article.free && (AuthVM.currentUser == nil || AuthVM.currentUser!.isPremium == false)   {

                                            NavigationStack{
                                                
                                                Button {
                                                    if MainVM.watchedAD == false {
                                                 //    reward.ShowReward()
                                                        dialog = true
                                                    } else {
                                                        print("dsadsa")
                                                    }
                                                    
                                                } label: {
                                                    Text("Şimdi Oku")
                                                        .font(.system(size: 19, weight: .semibold, design: .rounded))
                                                        .foregroundColor(.black)
                                                        .padding(.horizontal,32)
                                                        .padding(.vertical, 12)
                                                        .background(Color(hex: "eaeaec"))
                                                        .cornerRadius(8)
                                                }

                                                
                                            }.navigationDestination(isPresented: $MainVM.watchedAD) {
                                                StoryScreen(articleIndex: article.storynumber , article: ArticleVM.article[index])
                                            }

                                            
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
                                    
                                   
                             
                                    VStack{
                                        Text(getShortenedText(text: article.summary["Spanish"]!))
                                            .multilineTextAlignment(.leading)
                                            
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 16)
                                        
                                        Button(action: {
                                                      isSheetPresented = true
                                                  }, label: {
                                                      Text("Devamını Oku")
                                     })
                                    }.frame(width: UIScreen.main.bounds.width)
                                    
                                }.padding(.vertical, 35)
                            }
                            .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                            .frame(width: geometry.size.width,height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height * 0.65 + g.frame(in: .global).minY : UIScreen.main.bounds.height * 0.65)
                        }//Geo reader
                        .frame(height: UIScreen.main.bounds.height * 0.65)
                        VStack(alignment: .leading){
                            HStack{
                                Text("Benzer")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    
                                Image(systemName: "chevron.right")
                            }
                            .alignH(alignment: .leading)
                            .frame(width: geometry.size.width, height: 50)
                            .background(.white)

                            ScrollView(.horizontal, showsIndicators: false){
                                LazyHStack{
                                    
                                    if ArticleVM.article.filter({ $0.subject["Turkish"]! == article.subject["Turkish"]}).count == 0 {
                                        ForEach(Array(ArticleVM.article.filter{ $0.subject["Turkish"]! == article.subject["Turkish"]}.indices), id: \.self) { i in
                                            
                                            
                                            
                                            NavigationLink {
                                                StoryPreview(article: ArticleVM.article.filter({ $0.subject["Turkish"]! == article.subject["Turkish"]})[i], index: i)
                                            } label: {
                                                ZStack{
                                                    VStack{
                                                        
                                                        ZStack(alignment: .leading){
                                                            
                                                            KFImage(URL(string: ArticleVM.article.filter({ $0.subject["Turkish"]! == article.subject["Turkish"]})[i].images))
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
                                                }
                                            }
                                            
                                            
                                            
                                            
                                            
                                        }// for each loop
                                    }else {
                                        Text("dlksakhgdkusahdfas")
                                    }
                                }
                            }
                        }.padding(.leading, 16)

                    }//Scrollview
                    if dialog {
                        DialogContainer(isActivated: $dialog) {
                            reward.ShowReward()
                            MainVM.watchedAD = true
                        }
                    }
                }
                .padding(.bottom, 48)
                .navigationBarBackButtonHidden(true)
              
               
            }
            
        }
        .onAppear{
      
         
                
            reward.LoadReward()
             
            
        }.disabled(!reward.rewardLoaded)
      
        
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
                if AuthVM.currentUser != nil {
                    if AuthVM.currentUser!.favStories != nil && AuthVM.currentUser!.favStories!.contains(article.articleid) {
                        Button {
                            
                            ArchiveVM.removeFavArticle(articleID: article.articleid)
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
                            
                            ArchiveVM.addFavArticle(articleID: article.articleid)
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
                        
                    }}else {
                        Button {
                            
                      
                            
                        } label: {
                            Image(systemName: "person.circle")
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
        }
        .onChange(of: iconChange, perform: { _ in

            Task { await AuthVM.fetchUser() }
        })
        .sheet(isPresented: $isSheetPresented) {
            VStack{
                HStack(alignment:.center, spacing: 0){
               
                    Text(article.name["Spanish"]!)
                        .font(.system(size: 17, weight: .semibold))
                        
                        .padding()
                     
                         
               
                    Button {
                        isSheetPresented = false
                    } label: {
                      Text("Bitti")
                    
                    }.alignH(alignment: .trailing)
                  
          
                        
   
                }
                .padding(.horizontal,16)
                Text(article.summary["Spanish"]!)
                    .padding()
            }
            .presentationDetents([.fraction(0.6)])
            .presentationDragIndicator(.visible)
        }
       
      
        

    }
    
    
}



func getShortenedText(text: String) -> String {
    let threeDot = "..."
    let characterLimit = 100 // İstediğiniz karakter sınırını belirleyebilirsiniz
    if text.count > characterLimit {
        let index = text.index(text.startIndex, offsetBy: characterLimit)
        return String(text[..<index]) + threeDot
    } else {
        return text
    }
}

 
/* Button {

     if AuthVM.currentUser!.favStories!.contains(article.articleid){
         ArchiveVM.removeFavArticle(articleID: article.articleid)
         iconChange = false
     }else {
         ArchiveVM.addFavArticle(articleID: article.articleid)
         iconChange = true
     }
 } label: {
     if AuthVM.currentUser!.favStories!.contains(article.articleid) || iconChange == true {
         Image(systemName: "checkmark")
             .font(.system(size: 12))
             .foregroundColor(.white)
             .frame(width: 24, height: 24)
             .background(
                 Circle()
                     .foregroundColor(.gray.opacity(0.6))
             )
     }
     else {
         Image(systemName: "plus")
             .font(.system(size: 12))
             .foregroundColor(.white)
             .frame(width: 24, height: 24)
             .background(
                 Circle()
                     .foregroundColor(.gray.opacity(0.6))
             )
     
 }}*/
