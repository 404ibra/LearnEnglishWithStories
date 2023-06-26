//
//  StoryScreenViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 15.06.2023.
//
/*
import Foundation


struct StoryScreenViewModel {
   // kontrol et private var storiesIndex: Int
    
    static func getWords(for pageIndex: Int, storiesIndex: Int) -> [String] {
        // dizide belirtilen sayfa varsa ilgili kelimeleri döndürürü aksi halde boş dizi gönderir
        guard pageIndex >= 0 && pageIndex < Story.stories[0].content.count
        else {
            return []
        }
        return Story.stories[storiesIndex].content[pageIndex].components(separatedBy: " ")
    }
    
    
    static func getTranslateWords(for pageIndex: Int, storiesIndex: Int) -> [String] {
        guard pageIndex >= 0 && pageIndex < Story.stories[storiesIndex].translate.count
        else {
            return []
        }
        return Story.stories[storiesIndex].translate[pageIndex].components(separatedBy: " ")
    }
}
*/
