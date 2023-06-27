//
//  ContinueSection.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI
import Kingfisher


struct ContinueSection: View {
    @StateObject private var MainVM = MainVievModel()
    @ObservedObject private var ArticleVM = ArticleViewModel()
    
    
    let documentID: String
    
    init(documentID: String){
        self.documentID = documentID
        ArticleVM.getLastDataArticles(documentID: documentID)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Kaldığın Yerden Devam Et")
                .FeaturedStoriesHeadline()
            
            if ArticleVM.continousLoading == true {
                
                ZStack(alignment: .bottomLeading){
                    Rectangle()
                        .frame(height: 230)
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .cornerRadius(12)
                        .foregroundColor(.mainlightblue.opacity(0.6))
                        .redacted(reason: .placeholder)
                    
                    Rectangle()
                        .foregroundColor(.red.opacity(0.8))
                        .frame(height: 60)
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .roundedCornerRectangle(radius: 12, corners: [.bottomLeft, .bottomRight])
                    
                    Text("Brush: Learning")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 16)
                        .redacted(reason: .placeholder)
                }
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
            } else {
                ZStack(alignment: .bottom){
                    KFImage(URL(string: (ArticleVM.singleArticle?.images)!))
                        .resizable()
                        .frame(height: 230)
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .cornerRadius(12)
                        .redacted(reason: ArticleVM.continousLoading == true ? .placeholder : [])
                    
                    ZStack(alignment: .bottomLeading){
                        Rectangle()
                            .foregroundColor(.red.opacity(0.8))
                            .frame(height: 60)
                            .frame(width: UIScreen.main.bounds.width * 0.9)
                            .roundedCornerRectangle(radius: 12, corners: [.bottomLeft, .bottomRight])
                        
                        Text(ArticleVM.singleArticle?.name ?? "")
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 16)
                    }
                }
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
            }}
    }
    //VStack
}
   

/*
struct ContinueSection_Previews: PreviewProvider {
    static var previews: some View {
        ContinueSection()
    }
}
*/
