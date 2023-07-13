//
//  CategoryDetails.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 13.07.2023.
//

import SwiftUI
import Kingfisher

struct CategoryDetails: View {
    @EnvironmentObject  var ArticleVM : ArticleViewModel
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170, maximum: 225))
    ]
    
    
    let categorySubject: String
    let geometry = UIScreen.main.bounds.size
    var body: some View {
        NavigationStack{
            if ArticleVM.article.filter({ $0.subject["Turkish"] == categorySubject}).count > 0 {
                ForEach(Array(ArticleVM.article.filter({ $0.subject["Turkish"]! == categorySubject}).indices), id: \.self){i in
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns, spacing: 25) { 
                            NavigationLink {
                                StoryPreview(article: ArticleVM.article.filter({ $0.subject["Turkish"]! == categorySubject})[i], index: i)
                            } label: {
                                ZStack{
                                    VStack{
                                        ZStack(alignment: .leading){
                                            KFImage(URL(string: ArticleVM.article.filter({ $0.subject["Turkish"]! == categorySubject})[i].images))
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
                                        
                                        Text(ArticleVM.article.filter({ $0.subject["Turkish"]! == categorySubject})[i].name["Turkish"]!)
                                            .font(.system(size: 16.5, weight: .light, design: .rounded))
                                            .foregroundColor(.black)
                                    }
                                }//Label inside VStack
                            }

                        }
                    }
                }
            }else {
                VStack(alignment: .leading) {
                    Image("404")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.width * 0.8, height: geometry.height * 0.4)
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: -2)
                        .alignH(alignment: .center)
                    Text("Küçük bir problem var")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                    Text("Şu anlık küçük bir problem mevcut biz bu sorunu hallederken başka kategorilerden ilgini çeken parçalara göz atabilirsin")
                        .font(.system(size: 15, weight: .light, design: .rounded))
                        .foregroundColor(.gray)
                    Spacer()
                }.padding(.horizontal, 16)
            }

        }
        // for each loop
    }
}

/*

struct CategoryDetails_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetails()
    }
}
*/
