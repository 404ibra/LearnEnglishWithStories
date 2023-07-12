//
//  ArchiveViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 28.06.2023.
//

import Foundation


class ArchiveViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    let service = ArchiveService()
    
    func addNewWord(main: String, learn: String ){
        isLoading = true
        service.newFavWords(MainLanguage: main, LearningLanguage: learn)
        isLoading = true
    }
    
    func removeWord(main: String, learn: String ){
        service.deleteWord(MainLanguage: main, LearningLanguage: learn)
    }
    
    func addFavArticle(articleID: String){
        service.addFavArticle(ArticleID: articleID)
    }
    func removeFavArticle(articleID: String){
        service.removeFavArticle(ArticleID: articleID)
    }
}
