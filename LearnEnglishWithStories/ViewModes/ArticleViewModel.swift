//
//  ArticleViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 9.07.2023.
//

import Foundation


class ArticleManager: ObservableObject {
        

    func getContent(for currentPage: Int, storyIndex: Int, article: Article, language: String) -> [String]{
            guard ((article.content[language]) != nil) else {
                return []
            }
            guard currentPage >= 0 && currentPage < article.content[language]!.count
            else {
                return []
            }
            return  article.content[language]![currentPage].components(separatedBy: " ")
        }
    }
    
 
    
