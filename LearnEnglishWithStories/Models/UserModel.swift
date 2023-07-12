//
//  UserModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 17.06.2023.
//

import Foundation

//Buradaki codable encode, decode yapmamızı sağlıyor
struct UserModel: Identifiable, Codable {
    let id: String
    let fullName: String
    let isEmail: String
    let isPremium: Bool
    let lastStories: [String]?
    let favWords: [[String: String]]?
    let favStories: [String]?
    let medals: [String]?
    let level: Double?
    let history: [String]?
    let userLanguages: [String : String]?
}
