//
//  ArticleModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 18.06.2023.
//

import Foundation



struct Article: Identifiable, Codable {
    var id : String
    var articleid: String
    var storynumber: Int
    var name: String
    var readnow: Bool
    var subject: String
    var free: Bool
    var duration: String
    var summary: String
    var images: String
    var level: String
    var sounds: [String]
    var contentnames: [String]
    var content: [String]
    var translate: [String]
    
}


