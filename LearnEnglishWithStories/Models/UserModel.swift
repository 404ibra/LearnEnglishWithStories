//
//  UserModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 17.06.2023.
//

import Foundation


struct UserModel {
    var isPremium: Bool
    var lastStories: [String]
    var favWords: [String]
    var favStories: [String]
    var medals: [MedalModel]
    var level: Double
    var history: [String]
    
    static var currentUser: UserModel =
    UserModel(
              isPremium: false,
              lastStories: ["a", "b"],
              favWords: ["ss", "dd"],
              favStories: ["ali"],
              medals: [MedalModel.medals[0]],
              level: 10/5,
              history: ["hiç okumadı"])
}
