//
//  ArchiveViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 28.06.2023.
//

import Foundation


class ArchiveViewModel: ObservableObject {
    let service = ArchiveService()
    
    func addNewWord(main: String, learn: String ){
        service.newFavWords(MainLanguage: main, LearningLanguage: learn)
    }
}
