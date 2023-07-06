//
//  MyNotesView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.06.2023.
//

import SwiftUI

struct MyNotesView: View {
    @ObservedObject private var archiveVM = FavArticlesViewModel()
    
    init(){
        archiveVM.fetchFavArticles()
    }
    
    let geometry = UIScreen.main.bounds.size
    var body: some View {
        
        ScrollView {
            VStack{
                ForEach(archiveVM.favArticles ?? [""], id:\.self) {i in
                    Text(i)
                }
            }
        }
        
    }
}

struct MyNotesView_Previews: PreviewProvider {
    static var previews: some View {
        MyNotesView()
    }
}
