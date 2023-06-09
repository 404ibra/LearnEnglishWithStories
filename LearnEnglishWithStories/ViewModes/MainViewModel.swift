//
//  MainViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import Foundation

class MainVievModel: ObservableObject {
    @Published var showSecondPage = false
    @Published var isSearchVisible = false
    @Published var searchText = ""
    @Published var readButton = false
    @Published var playbutton = false
    @Published var isLongPressWord = false
    @Published var offset: CGFloat = 1000
    @Published var rectangleIsShown = false
    @Published var offsetImage: CGFloat = 0
    @Published var translateExpand = false
    @Published var learningLanguageExpand = false
    @Published var watchedAD: Bool = false
    @Published var saveWordSuccess: Bool = false
    @Published var learningLanguage: String?
    @Published var mainLanguage: String?
}
      




class SignupViewModel: ObservableObject{
    
}
