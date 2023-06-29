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
    
}
      



