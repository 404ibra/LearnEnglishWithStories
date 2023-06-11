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
            .foregroundColor(Color(hex: "#fa6c38"))
    }
    
    func SeeAll() -> some View {
        self
            .font(.system(size: 15, weight: .medium, design: .rounded))
           // .foregroundColor(.white)
    }
    
    func DescriptionFont() -> some View {
        self
            .font(.system(size: 17.5, weight: .light, design: .rounded))
     //       .foregroundColor(.white)
    }
    func LargeButtonFont() -> some View {
        self
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.orange)
            
    }
    func SettingsButtonFont() -> some View {
        self
            .font(.system(size: 16, weight: .bold, design: .rounded))
           
            
    }
}
