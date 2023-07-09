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
    var name: [String : String]
    var readnow: Bool
    var subject: [String : String]
    var free: Bool
    var duration: String
    var summary: [String : String]
    var images: String
    var level: [String : String]
    var sounds: [String]
    var content: [String: [String]]
   // var translate: [String]
    
}


