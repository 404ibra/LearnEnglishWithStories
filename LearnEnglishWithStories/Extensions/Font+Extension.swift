//
//  Font+Extension.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 3.06.2023.
//

import SwiftUI
    
  
extension View {
    func FeaturedStoriesHeadline() -> some View {
        self
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.white)
    }
    
    func SeeAll() -> some View {
        self
            .font(.system(size: 15, weight: .medium, design: .rounded))
            .foregroundColor(.white)
    }
}
