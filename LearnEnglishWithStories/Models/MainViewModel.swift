//
//  MainViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import Foundation

class MainVM: ObservableObject {
    
}



enum Tabs: String, CaseIterable{
    case search = "books.vertical";
    case profile = "person";
    case vocabulary = "book";
    case other = "gear";
}
